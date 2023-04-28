package com.vocsy.epub_viewer;

import android.content.Context;
import android.util.Log;
import android.graphics.Color;
import android.os.Bundle;
import android.view.View;
import android.view.WindowManager;
import android.widget.Toast;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.folioreader.Config;
import com.folioreader.FolioReader;
import com.folioreader.model.HighLight;
import com.folioreader.model.locators.ReadLocator;
import com.folioreader.ui.base.OnSaveHighlight;
import com.folioreader.util.AppUtil;
import com.folioreader.util.OnHighlightListener;
import com.folioreader.util.ReadLocatorListener;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.MethodChannel;

public class Reader extends AppCompatActivity
        implements OnHighlightListener, ReadLocatorListener, FolioReader.OnClosedListener {

    private ReaderConfig readerConfig;
    public FolioReader folioReader;
    private Context context;
    public MethodChannel.Result result;
    private EventChannel eventChannel;
    private EventChannel.EventSink pageEventSink;
    private EventChannel eventHighLightChannel;
    private EventChannel.EventSink highLightEventSink;
    private BinaryMessenger messenger;
    private ReadLocator read_locator;
    private static final String PAGE_CHANNEL = "sage";

    Reader(Context context, BinaryMessenger messenger, ReaderConfig config, EventChannel.EventSink sink, EventChannel.EventSink highLightSink) {
        this.context = context;
        readerConfig = config;

        getHighlightsAndSave();
        //setPageHandler(messenger);

        folioReader = FolioReader.get()
                .setOnHighlightListener(this)
                .setReadLocatorListener(this)
                .setOnClosedListener(this);
        pageEventSink = sink;
        highLightEventSink = highLightSink;
    }

    public void open(String bookPath, String lastLocation, String highLights) {
        final String path = bookPath;
        final String location = lastLocation;
        final String highLightsString = highLights;
        new Thread(new Runnable() {
            @Override
            public void run() {
                folioReader.deleteHighLights();
                try {
                    Log.i("SavedLocation", "-> savedLocation -> " + location);
                    if (location != null && !location.isEmpty()) {
                        ReadLocator readLocator = ReadLocator.fromJson(location);
                        folioReader.setReadLocator(readLocator);
                    }
                    folioReader.setConfig(readerConfig.config, true)
                            .openBook(path);
                } catch (Exception e) {
                    e.printStackTrace();
                }

                ArrayList<HighLight> highlightList = null;
                ObjectMapper objectMapper = new ObjectMapper();
                try {
                    highlightList = objectMapper.readValue(
                            highLightsString,
                            new TypeReference<List<HighlightData>>() {
                            });
                    if (highlightList == null)
                        {
                            Log.i("Reader", "nul nul nul");
                        }
                        Log.i("Reader", "nul nul test");
                    
                } catch (IOException e) {
                    e.printStackTrace();
                }

                if (highlightList != null) {
                    Log.i("Reader", "nul nul test test");
                    folioReader.saveReceivedHighLights(highlightList, new OnSaveHighlight() {
                        @Override
                        public void onFinished() {
                            //You can do anything on successful saving highlight list
                        }
                    });
                }
            }
        }).start();

    }

    public void close() {
        folioReader.close();
    }

    private void setPageHandler(BinaryMessenger messenger) {

        Log.i("event sink is", "in set page handler:");
        eventChannel = new EventChannel(messenger, PAGE_CHANNEL);

        try {

            eventChannel.setStreamHandler(new EventChannel.StreamHandler() {

                @Override
                public void onListen(Object o, EventChannel.EventSink eventSink) {

                    Log.i("event sink is", "this is eveent sink:");

                    pageEventSink = eventSink;
                    if (pageEventSink == null) {
                        Log.i("empty", "Sink is empty");
                    }
                }

                @Override
                public void onCancel(Object o) {

                }
            });
        } catch (Error err) {
            Log.i("and error", "error is " + err.toString());
        }
    }

    private void getHighlightsAndSave() {
        new Thread(new Runnable() {
            @Override
            public void run() {
                ArrayList<HighLight> highlightList = null;
                ObjectMapper objectMapper = new ObjectMapper();
                try {
                    highlightList = objectMapper.readValue(
                            loadAssetTextAsString("highlights/highlights_data.json"),
                            new TypeReference<List<HighlightData>>() {
                            });
                } catch (IOException e) {
                    e.printStackTrace();
                }

                // if (highlightList != null) {
                //     Log.i("Reader", "nul nul test test");
                //     folioReader.saveReceivedHighLights(highlightList, new OnSaveHighlight() {
                //         @Override
                //         public void onFinished() {
                //             //You can do anything on successful saving highlight list
                //         }
                //     });
                // }
            }
        }).start();
    }

    private String loadAssetTextAsString(String name) {
        BufferedReader in = null;
        try {
            StringBuilder buf = new StringBuilder();
            InputStream is = context.getAssets().open(name);
            in = new BufferedReader(new InputStreamReader(is));

            String str;
            boolean isFirst = true;
            while ((str = in.readLine()) != null) {
                if (isFirst)
                    isFirst = false;
                else
                    buf.append('\n');
                buf.append(str);
            }
            return buf.toString();
        } catch (IOException e) {
            Log.e("Reader", "Error opening asset " + name);
        } finally {
            if (in != null) {
                try {
                    in.close();
                } catch (IOException e) {
                    Log.e("Reader", "Error closing asset " + name);
                }
            }
        }
        return null;
    }

    @Override
    public void onFolioReaderClosed() {
        Log.i("readLocator", "-> saveReadLocator -> " + read_locator.toJson());

        if (pageEventSink != null) {
            pageEventSink.success(read_locator.toJson());
        }
    }

    @Override
    public void onHighlight(HighLight highlight, HighLight.HighLightAction type) {
        String enumString;
        switch (type){
            case NEW:
                enumString = "0";
                break;
            case MODIFY:
                enumString = "1";
                break;
            case DELETE:
            default:
                enumString = "2";
                break;
        }

        if (highLightEventSink != null) {
            highLightEventSink.success(enumString + highlight.toString());
        }
    }

    @Override
    public void saveReadLocator(ReadLocator readLocator) {
        read_locator = readLocator;
    }
}

package com.veryworks.android.httpbbs;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;

import java.util.List;

public class MainActivity extends AppCompatActivity
implements DataLoader.CallBack{

    RecyclerView list;
    CustomAdapter adapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        list = (RecyclerView)findViewById(R.id.list);

        DataLoader loader = new DataLoader();
        loader.getData("http://192.168.10.240:8080/bbs/json/list", this);
        adapter = new CustomAdapter();
        list.setAdapter(adapter);
        list.setLayoutManager(new LinearLayoutManager(this));
    }

    @Override
    public void setData(List<Bbs> list) {
        adapter.setList(list);
        adapter.notifyDataSetChanged();
    }
}

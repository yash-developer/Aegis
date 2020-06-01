package aegis.silverwing.com.aegis;

import android.app.ProgressDialog;
import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.DefaultItemAnimator;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.Toolbar;
import android.util.Log;
import android.view.View;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONObject;
import org.ksoap2.serialization.PropertyInfo;

import java.util.ArrayList;

/**
 * Created by admin on 09-Mar-18.
 */

public class FaqActivity extends AppCompatActivity {

    private RecyclerView recyclerView;
    private FaqAdapter adapter;
    private Faq faqModel;
    private static String TAG ="Faq_Activity";
    ProgressDialog progressDialog;
    ArrayList<Faq> FaqArrayList;

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_faq);
        Intent intent = getIntent();


        /*faqList = new ArrayList<>();
        adapter = new FaqAdapter(this, faqList);
        prepareFaq();*/


        //Adding toolbar to the activity
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        // back button
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        getSupportActionBar().setDisplayShowHomeEnabled(true);
        getSupportActionBar().setTitle("FAQ");

        toolbar.setNavigationOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(getApplicationContext(),MainActivity.class));
            }
        });



        recyclerView = (RecyclerView) findViewById(R.id.recycler_view);
        recyclerView.setLayoutManager(new LinearLayoutManager(this));
        recyclerView.setAdapter(adapter);
        recyclerView.setItemAnimator(new DefaultItemAnimator());
        new GetFaq().execute();

    }

    private  class GetFaq extends AsyncTask<String,String,JSONObject> {

        @Override
        protected void onPreExecute() {
            progressDialog = new ProgressDialog(FaqActivity.this);
            progressDialog.setMessage("Loading FAQs...");
            progressDialog.setCancelable(false);
            progressDialog.setCanceledOnTouchOutside(false);
            progressDialog.show();
            super.onPreExecute();
        }

        @Override
        protected JSONObject doInBackground(String... params) {

            PropertyInfo[] propertyInfos;// = new PropertyInfo[1];
            propertyInfos = null;
            /*propertyInfos[0] = new PropertyInfo();
            propertyInfos[0].setName("mode");
            propertyInfos[0].setValue(params[0]);
            propertyInfos[0].setType(String.class);*/

            WebserviceCall wc=new WebserviceCall();
            return  wc.MethodCall("GetFaq", propertyInfos);
        }

        @Override
        protected void onPostExecute(JSONObject jsonObject) {

            Log.d("TAG", jsonObject +"");
            if (jsonObject != null) {
                try {
                    FaqArrayList = new ArrayList<Faq>();

                    //if (jsonObject.getInt("status") == 1) {

                    if (jsonObject.has("Table")) {
                        JSONArray jsonArrayData = jsonObject.getJSONArray("Table");

                        Log.e(TAG, "Array Length" + jsonArrayData.length());
                        for (int i = 0; i < jsonArrayData.length(); i++) {
                            Log.e(TAG, "" + i + "==============");
                            faqModel = new Faq();


                            JSONObject dataObject = jsonArrayData.getJSONObject(i);

                            Log.i("FaqObject", "++" + dataObject);

                            if (dataObject.has("question")) {
                                String que = String.valueOf(dataObject.getString("question"));
                                Log.e(TAG, "Question====" + que);
                                faqModel.setQuestion(que);
                            }

                            if (dataObject.has("answer")) {
                                String ans = dataObject.getString("answer");
                                Log.e(TAG, "Answer====" + ans);
                                faqModel.setAnswer(ans);
                            }
                            FaqArrayList.add(faqModel);
                        }

                    }
                //}

                    if (FaqArrayList.size() > 0) {
                        for (int i = 0; i < FaqArrayList.size(); i++) {


                            Log.e(TAG, "run: " + "=" + FaqArrayList.get(i).getQuestion());
                        }

                        adapter = new FaqAdapter(FaqActivity.this, FaqArrayList);
                        recyclerView.setAdapter(adapter);
                    }
                    /*if (jsonObject.getInt("status") == 1) {
                        Toast.makeText(getApplicationContext(), "Registration successful", Toast.LENGTH_SHORT).show();
                        Toast.makeText(getApplicationContext(), "Login to continue", Toast.LENGTH_LONG).show();

                        Intent intent = new Intent(FaqActivity.this, UserLogin.class);
                        startActivity(intent);
                        finish();
                    } else {
                        Toast.makeText(getApplicationContext(), "Registration failed. Please try again!!", Toast.LENGTH_LONG).show();
                    }*/
                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else {
                Toast.makeText(getApplicationContext(), "Network error", Toast.LENGTH_LONG).show();
            }

            progressDialog.dismiss();
            super.onPostExecute(jsonObject);
        }
    }


}

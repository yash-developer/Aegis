package aegis.silverwing.com.aegis.Fragment;

import android.app.ProgressDialog;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.support.v7.widget.DefaultItemAnimator;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONObject;
import org.ksoap2.serialization.PropertyInfo;

import java.util.ArrayList;

import aegis.silverwing.com.aegis.EmergencyContact;
import aegis.silverwing.com.aegis.EmergencyContactAdapter;
import aegis.silverwing.com.aegis.R;
import aegis.silverwing.com.aegis.WebserviceCall;

/**
 * Created by admin on 03-Mar-18.
 */

public class EmergencyContact_frg extends Fragment {
    private RecyclerView recyclerView;
    private EmergencyContactAdapter adapter;
    private EmergencyContact contactModel;
    private static String TAG ="EC_Activity";
    ProgressDialog progressDialog;
    ArrayList<EmergencyContact> ContactArrayList;

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_emergency_contact,container,false);

        recyclerView = (RecyclerView)view.findViewById(R.id.recycler_view);
        recyclerView.setLayoutManager(new LinearLayoutManager(getActivity()));
        recyclerView.setAdapter(adapter);
        recyclerView.setItemAnimator(new DefaultItemAnimator());
        new GetEmergencyContact().execute();

        return view;
    }


    private  class GetEmergencyContact extends AsyncTask<String,String,JSONObject> {

        @Override
        protected void onPreExecute() {
            /*progressDialog = new ProgressDialog(getActivity());
            progressDialog.setMessage("Loading NewsFeed...");
            progressDialog.setCancelable(false);
            progressDialog.setCanceledOnTouchOutside(false);
            progressDialog.show();*/
            super.onPreExecute();
        }

        @Override
        protected JSONObject doInBackground(String... params) {

            PropertyInfo[] propertyInfos;
            propertyInfos = null;
            WebserviceCall wc=new WebserviceCall();
            return  wc.MethodCall("GetEmergencyContact", propertyInfos);
        }

        @Override
        protected void onPostExecute(JSONObject jsonObject) {

            Log.d("TAG", jsonObject +"");
            if (jsonObject != null) {
                try {
                    ContactArrayList = new ArrayList<EmergencyContact>();

                    //if (jsonObject.getInt("status") == 1) {

                    if (jsonObject.has("Table")) {
                        JSONArray jsonArrayData = jsonObject.getJSONArray("Table");

                        Log.e(TAG, "Array Length" + jsonArrayData.length());
                        for (int i = 0; i < jsonArrayData.length(); i++) {
                            Log.e(TAG, "" + i + "==============");
                            contactModel = new EmergencyContact();

                            JSONObject dataObject = jsonArrayData.getJSONObject(i);

                            Log.i("FaqObject", "++" + dataObject);

                            if (dataObject.has("station_name")) {
                                String station = String.valueOf(dataObject.getString("station_name"));
                                Log.e(TAG, "Station ====" + station);
                                contactModel.setStation(station);
                            }

                            if (dataObject.has("area")) {
                                String area = dataObject.getString("area");
                                Log.e(TAG, "Area ====" + area);
                                contactModel.setArea(area);
                            }

                            if (dataObject.has("contact_no")) {
                                int contact = dataObject.getInt("contact_no");
                                Log.e(TAG, "Contact ====" + contact);
                                String rcontact = Integer.toString(contact);
                                contactModel.setContact(rcontact);
                            }

                            /*if (dataObject.has("lat")) {
                                String lat = dataObject.getString("lat");
                                Log.e(TAG, "Latitude ====" + lat);
                                contactModel.setArea(lat);
                            }*/
                            ContactArrayList.add(contactModel);
                        }

                    }
                    //}

                    if (ContactArrayList.size() > 0) {
                        for (int i = 0; i < ContactArrayList.size(); i++) {


                            Log.e(TAG, "run: " + "=" + ContactArrayList.get(i).getStation());
                        }

                        adapter = new EmergencyContactAdapter(getActivity(), ContactArrayList);
                        recyclerView.setAdapter(adapter);
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else {
                Toast.makeText(getActivity(), "Network error", Toast.LENGTH_LONG).show();
            }

            //progressDialog.dismiss();
            super.onPostExecute(jsonObject);
        }
    }

}

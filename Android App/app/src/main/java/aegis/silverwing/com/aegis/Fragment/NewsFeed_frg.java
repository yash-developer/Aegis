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
import java.util.List;

import aegis.silverwing.com.aegis.NewsFeed;
import aegis.silverwing.com.aegis.NewsFeedAdapter;
import aegis.silverwing.com.aegis.R;
import aegis.silverwing.com.aegis.WebserviceCall;

/**
 * Created by admin on 03-Mar-18.
 */

public class NewsFeed_frg extends Fragment {


    private RecyclerView recyclerView;
    private NewsFeedAdapter adapter;
    private NewsFeed newsFeedModel;
    private static String TAG ="NewsFeed_Activity";
    ProgressDialog progressDialog;
    ArrayList<NewsFeed> NewsFeedArrayList;

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_newsfeed,container,false);

        /*newsfeedList = new ArrayList<>();
        adapter = new NewsFeedAdapter(newsfeedList);
        prepareNewsFeed();*/

        recyclerView = (RecyclerView)view.findViewById(R.id.recycler_view);
        recyclerView.setLayoutManager(new LinearLayoutManager(getActivity()));
        recyclerView.setAdapter(adapter);
        recyclerView.setItemAnimator(new DefaultItemAnimator());
        new GetNewsFeed().execute();

        return view;
    }

    private  class GetNewsFeed extends AsyncTask<String,String,JSONObject> {

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
            return  wc.MethodCall("GetNewsFeed", propertyInfos);
        }

        @Override
        protected void onPostExecute(JSONObject jsonObject) {

            Log.d("TAG", jsonObject +"");
            if (jsonObject != null) {
                try {
                    NewsFeedArrayList = new ArrayList<NewsFeed>();

                    //if (jsonObject.getInt("status") == 1) {

                    if (jsonObject.has("Table")) {
                        JSONArray jsonArrayData = jsonObject.getJSONArray("Table");

                        Log.e(TAG, "Array Length" + jsonArrayData.length());
                        for (int i = 0; i < jsonArrayData.length(); i++) {
                            Log.e(TAG, "" + i + "==============");
                            newsFeedModel = new NewsFeed();

                            JSONObject dataObject = jsonArrayData.getJSONObject(i);

                            Log.i("FaqObject", "++" + dataObject);

                            if (dataObject.has("title")) {
                                String title = String.valueOf(dataObject.getString("title"));
                                Log.e(TAG, "Title====" + title);
                                newsFeedModel.setTitle(title);
                            }

                            if (dataObject.has("description")) {
                                String desc = dataObject.getString("description");
                                Log.e(TAG, "Description====" + desc);
                                newsFeedModel.setDescription(desc);
                            }
                            NewsFeedArrayList.add(newsFeedModel);
                        }

                    }
                    //}

                    if (NewsFeedArrayList.size() > 0) {
                        for (int i = 0; i < NewsFeedArrayList.size(); i++) {


                            Log.e(TAG, "run: " + "=" + NewsFeedArrayList.get(i).getTitle());
                        }

                        adapter = new NewsFeedAdapter(getActivity(), NewsFeedArrayList);
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
                Toast.makeText(getActivity(), "Network error", Toast.LENGTH_LONG).show();
            }

            //progressDialog.dismiss();
            super.onPostExecute(jsonObject);
        }
    }



    /*private void prepareNewsFeed() {

        NewsFeed a = new NewsFeed("Apocalypse Started","The world is ending grab everything you can and save your self. No place is safe.");
        newsfeedList.add(a);

        a = new NewsFeed("Fall of USA","USA has fallen into the deapths of the ocean. No Survivors");
        newsfeedList.add(a);

        a = new NewsFeed("Asia falls apart","Asia has broken down into pieces. Seperating from russia, china, India. All the broken parts are sinking slowly into the water. Not long before oceans swallow the land.");
        newsfeedList.add(a);

        a = new NewsFeed("Africa is safe","Africa is the only safe place not sinking in the ocean. All survivors are advised to reach africa by any means. Good Luck");
        newsfeedList.add(a);

        a = new NewsFeed("Endless Devastation. Aliens are here","Several Alien SpaceShips have landed on the land of africa. Their motive are unknown. But their hostility is not as they have abducted more than 100 people");
        newsfeedList.add(a);

        a = new NewsFeed("We have overthrown Aliens","A lone traveller has defeated the aliens and captured them by their own weapons. and secured them in a SpaceShip");
        newsfeedList.add(a);

        a = new NewsFeed("The next Frontier","The traveller is going to use the SpaceShips to leave earth and go to a nearby planet marked as livable by the aliens. Several People are requesting him to take them with him");
        newsfeedList.add(a);

        a = new NewsFeed("All Aboard","The hero has agreed to take the survivors with him. Humanity has left its home and now goes towards the depth of the unknown");
        newsfeedList.add(a);


        adapter.notifyDataSetChanged();
    }*/
}

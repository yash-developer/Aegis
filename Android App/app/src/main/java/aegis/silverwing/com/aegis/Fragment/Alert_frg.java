package aegis.silverwing.com.aegis.Fragment;

import android.app.ProgressDialog;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.location.Location;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.ActivityCompat;
import android.support.v4.app.Fragment;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.Toast;

import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.GooglePlayServicesUtil;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.location.LocationRequest;
import com.google.android.gms.location.LocationServices;

import org.json.JSONObject;
import org.ksoap2.serialization.PropertyInfo;

import aegis.silverwing.com.aegis.AlertActivity;
import aegis.silverwing.com.aegis.MainActivity;
import aegis.silverwing.com.aegis.R;
import aegis.silverwing.com.aegis.SessionManager;
import aegis.silverwing.com.aegis.WebserviceCall;

/**
 * Created by admin on 03-Mar-18.
 */

public class Alert_frg extends Fragment implements View.OnClickListener, GoogleApiClient.ConnectionCallbacks,
        GoogleApiClient.OnConnectionFailedListener {

    // LogCat tag
    private static final String TAG = MainActivity.class.getSimpleName();

    private final static int PLAY_SERVICES_RESOLUTION_REQUEST = 1000;

    private Location mLastLocation;

    // Google client to interact with Google API
    private GoogleApiClient mGoogleApiClient;

    // boolean flag to toggle periodic location updates
    private boolean mRequestingLocationUpdates = false;

    private LocationRequest mLocationRequest;

    // Location updates intervals in sec
    private static int UPDATE_INTERVAL = 10000; // 10 sec
    private static int FATEST_INTERVAL = 5000; // 5 sec
    private static int DISPLACEMENT = 10; // 10 meters

    double userlatitude;
    double userlongitude;

    SessionManager session;
    ProgressDialog progressDialog;

    private Button police, medical, firebrigade;

    public Alert_frg() {

    }

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_alert, container, false);

        police = (Button) view.findViewById(R.id.police);
        medical = (Button) view.findViewById(R.id.medical);
        firebrigade = (Button) view.findViewById(R.id.firebrigade);

        session = new SessionManager(getActivity());

        // First we need to check availability of play services
        if (checkPlayServices()) {

            // Building the GoogleApi client
            buildGoogleApiClient();
        }



        police.setOnClickListener(this);
        medical.setOnClickListener(this);
        firebrigade.setOnClickListener(this);



        return view;
    }


    @Override
    public void onClick(View v) {

        displayLocation();
        Toast.makeText(getActivity(),"Latitude = "+userlatitude+"  Longitude = "+userlongitude,Toast.LENGTH_LONG).show();

        new LocationInsert().execute(
                session.getUserId(),
                Double.toString(userlatitude),
                Double.toString(userlongitude));

    }


    /**
     * Method to display the location on UI
     * */
    private void displayLocation() {

        if (ActivityCompat.checkSelfPermission(getActivity(), android.Manifest.permission.ACCESS_FINE_LOCATION) != PackageManager.PERMISSION_GRANTED && ActivityCompat.checkSelfPermission(getActivity(), android.Manifest.permission.ACCESS_COARSE_LOCATION) != PackageManager.PERMISSION_GRANTED) {
            // TODO: Consider calling
            //    ActivityCompat#requestPermissions
            // here to request the missing permissions, and then overriding
            //   public void onRequestPermissionsResult(int requestCode, String[] permissions,
            //                                          int[] grantResults)
            // to handle the case where the user grants the permission. See the documentation
            // for ActivityCompat#requestPermissions for more details.
            return;
        }
        mLastLocation = LocationServices.FusedLocationApi
                .getLastLocation(mGoogleApiClient);

        if (mLastLocation != null) {
            double latitude = mLastLocation.getLatitude();
            double longitude = mLastLocation.getLongitude();

            userlatitude = latitude;
            userlongitude = longitude;

        } else {

            Toast.makeText(getActivity(), "\"(Couldn't get the location. Make sure location is enabled on the device)\"",Toast.LENGTH_LONG).show();

        }
    }

    /**
     * Creating google api client object
     * */
    protected synchronized void buildGoogleApiClient() {
        mGoogleApiClient = new GoogleApiClient.Builder(getActivity())
                .addConnectionCallbacks(this)
                .addOnConnectionFailedListener(this)
                .addApi(LocationServices.API).build();
    }

    /**
     * Method to verify google play services on the device
     * */
    private boolean checkPlayServices() {
        int resultCode = GooglePlayServicesUtil
                .isGooglePlayServicesAvailable(getActivity());
        if (resultCode != ConnectionResult.SUCCESS) {
            if (GooglePlayServicesUtil.isUserRecoverableError(resultCode)) {
                GooglePlayServicesUtil.getErrorDialog(resultCode, getActivity(),
                        PLAY_SERVICES_RESOLUTION_REQUEST).show();
            } else {
                Toast.makeText(getActivity().getApplicationContext(),
                        "This device is not supported.", Toast.LENGTH_LONG)
                        .show();
                getActivity().finish();
            }
            return false;
        }
        return true;
    }

    @Override
    public void onStart() {
        super.onStart();
        if (mGoogleApiClient != null) {
            mGoogleApiClient.connect();
        }
    }

    @Override
    public void onResume() {
        super.onResume();

        checkPlayServices();
    }

    /**
     * Google api callback methods
     */
    @Override
    public void onConnectionFailed(ConnectionResult result) {
        Log.i(TAG, "Connection failed: ConnectionResult.getErrorCode() = "
                + result.getErrorCode());
    }

    @Override
    public void onConnected(Bundle arg0) {

        // Once connected with google api, get the location
        displayLocation();
    }

    @Override
    public void onConnectionSuspended(int arg0) {
        mGoogleApiClient.connect();
    }



    private  class LocationInsert extends AsyncTask<String,String,JSONObject> {

        @Override
        protected void onPreExecute() {
            progressDialog = new ProgressDialog(getActivity());
            progressDialog.setMessage("Sending Your Location...");
            progressDialog.setCancelable(false);
            progressDialog.setCanceledOnTouchOutside(false);
            progressDialog.show();
            super.onPreExecute();
        }

        @Override
        protected JSONObject doInBackground(String... params) {

            PropertyInfo[] propertyInfos = new PropertyInfo[3];

            propertyInfos[0] = new PropertyInfo();
            propertyInfos[0].setName("user_id");
            propertyInfos[0].setValue(params[0]);
            propertyInfos[0].setType(String.class);

            propertyInfos[1] = new PropertyInfo();
            propertyInfos[1].setName("latitude");
            propertyInfos[1].setValue(params[1]);
            propertyInfos[1].setType(String.class);

            propertyInfos[2] = new PropertyInfo();
            propertyInfos[2].setName("longitude");
            propertyInfos[2].setValue(params[2]);
            propertyInfos[2].setType(String.class);


            WebserviceCall wc=new WebserviceCall();
            return  wc.MethodCall("InsertLocation", propertyInfos);
        }

        @Override
        protected void onPostExecute(JSONObject jsonObject) {

            Log.d("TAG", jsonObject +"");
            if (jsonObject != null) {
                try {

                    if (jsonObject.getInt("status") == 1) {
                        Toast.makeText(getActivity().getApplicationContext(), "Location Sent Successful", Toast.LENGTH_SHORT).show();

                        Intent intent = new Intent(getActivity(), AlertActivity.class);
                        startActivity(intent);
                    } else {
                        Toast.makeText(getActivity().getApplicationContext(), "Sending Location Failed", Toast.LENGTH_LONG).show();
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




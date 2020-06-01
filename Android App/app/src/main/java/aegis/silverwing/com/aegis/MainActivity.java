package aegis.silverwing.com.aegis;

import android.content.Intent;
import android.os.Bundle;
import android.support.design.widget.TabLayout;
import android.support.v4.view.ViewPager;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.Toast;

import aegis.silverwing.com.aegis.Fragment.Alert_frg;
import aegis.silverwing.com.aegis.Fragment.EmergencyContact_frg;
import aegis.silverwing.com.aegis.Fragment.NewsFeed_frg;

public class MainActivity extends AppCompatActivity {

    private TabLayout tabLayout;
    private ViewPager viewPager;
    private int[] tabIcons = {
            R.drawable.newsfeed,
            R.drawable.alert,
            R.drawable.emergencycontact
    };


    SessionManager session;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Intent intent = getIntent();

        // Checking if the user has logged in or not.
        session = new SessionManager(getApplicationContext());
        session.checkLogin();

        //Adding toolbar to the activity
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);


        //getSupportActionBar().setDisplayHomeAsUpEnabled(true);

        //Intiallizing viewPager

        viewPager = (ViewPager) findViewById(R.id.viewPager);
        setUpWithViewPager(viewPager);

        tabLayout = (TabLayout) findViewById(R.id.tabLayout);
        tabLayout.setupWithViewPager(viewPager);
        setupTabIcons();

        // tabLayout.setupWithViewPager(viewPager);

        //Creating our pager adapter


        //Adding adapter to pager


    }

    // this adds menu to the action bar
    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.main, menu);
        return true;
    }

    // What to do when a menu item is selected
    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {

            // action with the aegis icon
            case android.R.id.home:
                Intent intent = new Intent(this, MainActivity.class);
                intent.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
                startActivity(intent);
                break;

            // action with ID action_faq was selected
            case R.id.action_faq:
                Toast.makeText(this, "FAQ selected", Toast.LENGTH_SHORT)
                        .show();
                Intent faq = new Intent(this, FaqActivity.class);
                startActivity(faq);
                break;

            // action with ID action_settings was selected
            case R.id.action_settings:
                Toast.makeText(this, "Settings selected", Toast.LENGTH_SHORT)
                        .show();
                Intent settings = new Intent(this, SettingsActivity.class);
                startActivity(settings);
                break;

            // action with ID action_contactus was selected
            case R.id.action_contactus:
                Toast.makeText(this, "Contact us selected", Toast.LENGTH_SHORT)
                        .show();
                Intent contactus = new Intent(this, ContactUsActivity.class);
                startActivity(contactus);
                break;

            // action with ID action_help was selected
            case R.id.action_help:
                Toast.makeText(this, "Help selected", Toast.LENGTH_SHORT)
                        .show();
                Intent help = new Intent(this, HelpActivity.class);
                startActivity(help);
                break;

            default:
                break;
        }

        return super.onOptionsItemSelected(item);
    }

    private void setupTabIcons() {
        tabLayout.getTabAt(0).setIcon(tabIcons[0]);
        tabLayout.getTabAt(1).setIcon(tabIcons[1]);
        tabLayout.getTabAt(2).setIcon(tabIcons[2]);
    }

    public void setUpWithViewPager(ViewPager viewPager) {
        this.viewPager = viewPager;
        pageradapter adapter = new pageradapter(getSupportFragmentManager());
        adapter.addFragment(new NewsFeed_frg() ,"NewsFeed");
        adapter.addFragment(new Alert_frg(),"Alert");
        adapter.addFragment(new EmergencyContact_frg(),"Emergency Contact");
        viewPager.setAdapter(adapter);
        viewPager.setCurrentItem(1);
    }
}

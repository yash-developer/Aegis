package aegis.silverwing.com.aegis;

import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentPagerAdapter;
import android.support.v4.app.FragmentStatePagerAdapter;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by admin on 03-Mar-18.
 */

public class pageradapter extends FragmentPagerAdapter {
    //for page count
    int tabcount;

    private final List<Fragment> mFragmentList = new ArrayList<>();
    private final List<String> mFragmentTitleList = new ArrayList<>();


    //constructor of class
    public pageradapter(FragmentManager supportFragmentManager) {
        super(supportFragmentManager);
    }

    // Get method
    @Override
    public Fragment getItem(int position) {
        return mFragmentList.get(position);

        /*switch (position)
        {
            case 0:
                NewsFeed_frg n1 = new NewsFeed_frg();
                return n1;

            case 1:
                Alert_frg a1= new Alert_frg();
                return a1;

            case 2:
                EmergencyContact_frg e1= new EmergencyContact_frg();
                return e1;

            default:
                Alert_frg a2 = new Alert_frg();
                return a2;
        }*/
    }

    @Override
    public int getCount() {
        return mFragmentList.size();
    }

    public void addFragment(Fragment fragment, String string) {
        mFragmentList.add(fragment);
        mFragmentTitleList.add(string);
    }

}

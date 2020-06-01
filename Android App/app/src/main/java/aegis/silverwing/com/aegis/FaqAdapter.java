package aegis.silverwing.com.aegis;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import java.util.List;

/**
 * Created by admin on 10-Mar-18.
 */

public class FaqAdapter extends RecyclerView.Adapter<FaqAdapter.MyViewHolder> {
    private Context mContext;
    private List<Faq> faqList;

    public class MyViewHolder extends RecyclerView.ViewHolder {
        public TextView question, answer;

        public MyViewHolder(View view) {
            super(view);
            question = (TextView) view.findViewById(R.id.que);
            answer = (TextView) view.findViewById(R.id.ans);

        }
    }

    public FaqAdapter(Context mContext, List<Faq> faqList) {
        this.mContext = mContext;
        this.faqList = faqList;
    }

    @Override
    public MyViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View itemView = LayoutInflater.from(parent.getContext())
                .inflate(R.layout.faq_card, parent, false);

        return new MyViewHolder(itemView);
    }

    @Override
    public void onBindViewHolder(MyViewHolder holder, int position) {
        Faq faq = faqList.get(position);
        holder.question.setText(faq.getQuestion());
        holder.answer.setText(faq.getAnswer());

    }

    @Override
    public int getItemCount() {
        return faqList.size();
    }


}

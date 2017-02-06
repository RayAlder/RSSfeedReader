package com.feedApp.feed;

import com.rometools.rome.feed.synd.SyndFeed;
import com.rometools.rome.io.SyndFeedInput;
import com.rometools.rome.io.XmlReader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import java.util.Date;

/**
 * Created by Ray on 04/02/2017.
 */
@Controller
public class FeedController {

    private FeedService feedService;

    @Autowired
    public void setFeedService(FeedService feedService) {
        this.feedService = feedService;
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String listFeeds(Model model){
        model.addAttribute("feeds", feedService.listAllFeeds());
        return "feeds";
    }

    @RequestMapping("feed/{id}")
    public String showFeed(@PathVariable Integer id, Model model){
        model.addAttribute("feed", feedService.getFeedById(id));
        return "feedshow";
    }

    @RequestMapping("feed/edit/{id}")
    public String edit(@PathVariable Integer id, Model model){
        model.addAttribute("feed", feedService.getFeedById(id));
        return "feedform";
    }

    @RequestMapping("feed/new")
    public String newFeed(Model model){
        model.addAttribute("feed", new Feed());
        return "feedform";
    }

    @RequestMapping(value = "feed", method = RequestMethod.POST)
    public String saveFeed(Feed feed){
        feedService.fetchFeedItems(feed);
        feedService.saveFeed(feed);
        return "redirect:/feed/" + feed.getId();
    }

    @RequestMapping("feed/delete/{id}")
    public String delete(@PathVariable Integer id){
        feedService.deleteFeed(id);
        return "redirect:/";
    }

}

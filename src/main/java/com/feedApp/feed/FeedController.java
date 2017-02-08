package com.feedApp.feed;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.text.SimpleDateFormat;
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

    @Autowired
    FeedFormValidator feedFormValidator;

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.setValidator(feedFormValidator);
        SimpleDateFormat sdf = new SimpleDateFormat("MM-dd-yyyy HH:mm:ss");
        sdf.setLenient(false);
        binder.registerCustomEditor(Date.class, "lastUpdate", new CustomDateEditor(sdf, true));
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String listFeeds(Model model){
        model.addAttribute("feeds", feedService.listAllFeeds());
        return "feeds";
    }

    @RequestMapping("feed/{id}")
    public String showFeed(@PathVariable Integer id, Model model, RedirectAttributes redirectAttributes){
        Feed feed=feedService.getFeedById(id);
        if(feed==null) {
            redirectAttributes.addFlashAttribute("css", "danger");
            redirectAttributes.addFlashAttribute("msg", "Feed "+id+" does not exist");
            return "redirect:/";
        } else{
            model.addAttribute("feed", feed);
            return "feedshow";
        }
    }

    @RequestMapping("feed/edit/{id}")
    public String edit(@PathVariable Integer id, Model model){
        model.addAttribute("feedForm", feedService.getFeedById(id));
        return "feedform";
    }

    @RequestMapping("feed/new")
    public String newFeed(Model model){
        model.addAttribute("feedForm", new Feed());
        return "feedform";
    }

    @RequestMapping(value = "feed", method = RequestMethod.POST)
    public String saveFeed(@ModelAttribute("feedForm") @Validated Feed feed, BindingResult result, Model model,
    final RedirectAttributes redirectAttributes){
        if (result.hasErrors()) {
            return "feedform";
        } else {
            if(!feedService.fetchFeedItems(feed)){
                result.rejectValue("url","error.feed", "Could not connect to the specified url");
                return "feedform";
            } else {
                feedService.saveFeed(feed);
                redirectAttributes.addFlashAttribute("css", "success");
                redirectAttributes.addFlashAttribute("msg", "Feed information saved!");
                return "redirect:/feed/" + feed.getId();
            }
        }
    }

    @RequestMapping("feed/delete/{id}")
    public String delete(@PathVariable Integer id, final RedirectAttributes redirectAttributes){
        if(feedService.getFeedById(id)==null) {
            redirectAttributes.addFlashAttribute("css", "danger");
            redirectAttributes.addFlashAttribute("msg", "Feed "+id+" does not exist");
            return "redirect:/";
        }
        feedService.deleteFeed(id);

        redirectAttributes.addFlashAttribute("css", "success");
        redirectAttributes.addFlashAttribute("msg", "Feed has been deleted!");

        return "redirect:/";
    }

    @RequestMapping("feed/fetchItems/{id}")
    public String fetchItems(@PathVariable Integer id, final RedirectAttributes redirectAttributes){
        Feed feed=feedService.getFeedById(id);
        if (feed==null){
            redirectAttributes.addFlashAttribute("css", "danger");
            redirectAttributes.addFlashAttribute("msg", "Feed "+id+" does not exist");
            return "redirect:/";
        } else {
            if (!feedService.fetchFeedItems(feed)) {
                redirectAttributes.addFlashAttribute("css", "danger");
                redirectAttributes.addFlashAttribute("msg", "Could fetch data from: " + feed.getUrl());
            } else {
                redirectAttributes.addFlashAttribute("css", "success");
                redirectAttributes.addFlashAttribute("msg", "Feed contents synchronized!");
                feedService.saveFeed(feed);
            }
        }
        return "redirect:/feed/{id}";
    }

}

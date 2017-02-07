package com.feedApp.Validator;

import com.feedApp.feed.Feed;
import com.feedApp.feed.FeedService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

//http://docs.spring.io/spring/docs/current/spring-framework-reference/html/validation.html#validation-mvc-configuring
@Component
public class FeedFormValidator implements Validator {

    @Autowired
    FeedService feedService;

    @Override
    public boolean supports(Class<?> clazz) {
        return Feed.class.equals(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {

        Feed feed = (Feed) target;

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "url", "NotEmpty.feed.url");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "feedName", "NotEmpty.feed.feedName");

        if(!(feed.getUrl().contains("http://")||feed.getUrl().contains("https://"))){
            errors.rejectValue("url", "NoProtocol.feed.url");
        }

    }

}
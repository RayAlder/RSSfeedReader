package com.feedApp.item;

import com.feedApp.feed.Feed;
import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * Created by Ray on 04/02/2017.
 */

@Entity
@Table(name="items")
public class Item implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    @ManyToOne
    @JoinColumn(name="feed_id", insertable=false, updatable=false, nullable=false)
    private Feed sourceFeed;

    @Column
    private String title;

    @Column
    private String link;

    @Column
    private String description;

    @Column(columnDefinition="DATETIME")
    @Temporal(TemporalType.TIMESTAMP)
    private Date published;

    public Item() {
    }

    public Item(String title, String link, Date published) {
        this.title=title;
        this.link=link;
        this.published=published;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Feed getSourceFeed() {
        return sourceFeed;
    }

    public void setSourceFeed(Feed sourceFeed) {
        this.sourceFeed = sourceFeed;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getPublished() {
        return published;
    }

    public void setPublished(Date published) {
        this.published = published;
    }
}

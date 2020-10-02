package edu.matc.entjava.socialite.entity;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.UpdateTimestamp;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.Objects;
import java.util.Set;

/**
 * Location class defines a location object and its methods
 */
@Entity(name = "Location")
@Table(name = "locations")
public class Location {

    private String name;
    private String yelpUrl;
    private String yelpID;
    private int price;
    private int rating;
    private String imageUrl;
    private String phone;
    private int reviewCount;

    @CreationTimestamp
    private LocalDateTime created;
    @UpdateTimestamp
    private LocalDateTime modified;

    @OneToMany(mappedBy = "location", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private Set<LocationCategory> categories = new HashSet<>();

    @OneToMany(mappedBy = "location", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private Set<LocationAddress> addresses = new HashSet<>();

    @OneToMany(mappedBy = "location", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private Set<UserPlan> userPlans = new HashSet<>();

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "native")
    @GenericGenerator(name = "native", strategy = "native")
    private int id;

    /**
     * Instantiates a new location.
     */
    public Location() {}

    /**
     * Instantiates a new Location.
     *
     * @param name        the name
     * @param yelpUrl     the yelp url
     * @param yelpID      the yelp id
     * @param price       the price
     * @param rating      the rating
     * @param imageUrl    the image url
     * @param phone       the phone
     * @param reviewCount the review count
     */
    public Location(String name, String yelpUrl, String yelpID, int price, int rating, String imageUrl, String phone, int reviewCount) {
        this.name = name;
        this.yelpUrl = yelpUrl;
        this.yelpID = yelpID;
        this.price = price;
        this.rating = rating;
        this.imageUrl = imageUrl;
        this.phone = phone;
        this.reviewCount = reviewCount;
    }

    /**
     * Gets name.
     *
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * Sets name.
     *
     * @param name the name
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * Gets yelp url.
     *
     * @return the yelp url
     */
    public String getYelpUrl() {
        return yelpUrl;
    }

    /**
     * Sets yelp url.
     *
     * @param yelpUrl the yelp url
     */
    public void setYelpUrl(String yelpUrl) {
        this.yelpUrl = yelpUrl;
    }

    /**
     * Gets yelp id.
     *
     * @return the yelp id
     */
    public String getYelpID() {
        return yelpID;
    }

    /**
     * Sets yelp id.
     *
     * @param yelpID the yelp id
     */
    public void setYelpID(String yelpID) {
        this.yelpID = yelpID;
    }

    /**
     * Gets price.
     *
     * @return the price
     */
    public int getPrice() {
        return price;
    }

    /**
     * Sets price.
     *
     * @param price the price
     */
    public void setPrice(int price) {
        this.price = price;
    }

    /**
     * Gets rating.
     *
     * @return the rating
     */
    public int getRating() {
        return rating;
    }

    /**
     * Sets rating.
     *
     * @param rating the rating
     */
    public void setRating(int rating) {
        this.rating = rating;
    }

    /**
     * Gets image url.
     *
     * @return the image url
     */
    public String getImageUrl() {
        return imageUrl;
    }

    /**
     * Sets image url.
     *
     * @param imageUrl the image url
     */
    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    /**
     * Gets phone.
     *
     * @return the phone
     */
    public String getPhone() {
        return phone;
    }

    /**
     * Sets phone.
     *
     * @param phone the phone
     */
    public void setPhone(String phone) {
        this.phone = phone;
    }

    /**
     * Gets review count.
     *
     * @return the review count
     */
    public int getReviewCount() {
        return reviewCount;
    }

    /**
     * Sets review count.
     *
     * @param reviewCount the review count
     */
    public void setReviewCount(int reviewCount) {
        this.reviewCount = reviewCount;
    }

    /**
     * Gets created.
     *
     * @return the created
     */
    public LocalDateTime getCreated() {
        return created;
    }

    /**
     * Sets created.
     *
     * @param created the created
     */
    public void setCreated(LocalDateTime created) {
        this.created = created;
    }

    /**
     * Gets modified.
     *
     * @return the modified
     */
    public LocalDateTime getModified() {
        return modified;
    }

    /**
     * Sets modified.
     *
     * @param modified the modified
     */
    public void setModified(LocalDateTime modified) {
        this.modified = modified;
    }

    /**
     * Gets id.
     *
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * Sets id.
     *
     * @param id the id
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * Gets addresses.
     *
     * @return the addresses
     */
    public Set<LocationAddress> getAddresses() {
        return addresses;
    }

    /**
     * Sets addresses.
     *
     * @param addresses the addresses
     */
    public void setAddresses(Set<LocationAddress> addresses) {
        this.addresses = addresses;
    }

    /**
     * Gets categories.
     *
     * @return the categories
     */
    public Set<LocationCategory> getCategories() {
        return categories;
    }

    /**
     * Sets categories.
     *
     * @param categories the categories
     */
    public void setCategories(Set<LocationCategory> categories) {
        this.categories = categories;
    }

    /**
     * Gets user plans.
     *
     * @return the user plans
     */
    public Set<UserPlan> getUserPlans() {
        return userPlans;
    }

    /**
     * Sets user plans.
     *
     * @param userPlans the user plans
     */
    public void setUserPlans(Set<UserPlan> userPlans) {
        this.userPlans = userPlans;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Location location = (Location) o;
        return price == location.price &&
                rating == location.rating &&
                reviewCount == location.reviewCount &&
                id == location.id &&
                name.equals(location.name) &&
                yelpUrl.equals(location.yelpUrl) &&
                yelpID.equals(location.yelpID) &&
                imageUrl.equals(location.imageUrl) &&
                phone.equals(location.phone);
    }

    @Override
    public int hashCode() {
        return Objects.hash(name, yelpUrl, yelpID, price, rating, imageUrl, phone, reviewCount, id);
    }

    @Override
    public String toString() {
        return "Location{" +
                "name='" + name + '\'' +
                ", yelpUrl='" + yelpUrl + '\'' +
                ", yelpID='" + yelpID + '\'' +
                ", price=" + price +
                ", rating=" + rating +
                ", imageUrl='" + imageUrl + '\'' +
                ", phone='" + phone + '\'' +
                ", reviewCount=" + reviewCount +
                ", id=" + id +
                '}';
    }
}
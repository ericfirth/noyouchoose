NYC.Views.NewPlan = Backbone.CompositeView.extend({

  template: JST["plans/new"],

  events: {
    "click #make-plan": "makePlan"
  },

  makePlan: function(event) {
    event.preventDefault();
    var $detailPlan = this.$(".detail-plan-form");
    var $filterRestaurants = this.$(".filter-restaurant-form");
    var attrs = $detailPlan.serializeJSON();
    attrs = _.extend(attrs, $filterRestaurants.serializeJSON());
    var plan = new NYC.Models.Plan();
    plan.save(attrs, {
      success: function() {

      }
    })

  },

  render: function () {
    this.$el.html(this.template());
    this.addSubview(".detail-plan", new NYC.Views.DetailPlan());
    this.addSubview(".invite-friends", new NYC.Views.InviteFriends());
    this.addSubview(".filter-restaurants", new NYC.Views.FilterRestaurants());
    return this;
  }

});

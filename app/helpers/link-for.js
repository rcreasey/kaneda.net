import Ember from 'ember';

export function linkFor(text, href) {
  text = Ember.Handlebars.Utils.escapeExpression(text);
  href = Ember.Handlebars.Utils.escapeExpression(href);

  return new Ember.Handlebars.SafeString('<a target="_blank" href="' + href + '">' + text + '</a>');
}

export default Ember.Handlebars.makeBoundHelper(linkFor);

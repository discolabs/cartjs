describe('Formatters', function() {

  beforeEach(function() {
    CartJS.init(Fixtures.getCart('empty'), {
      "currency": "USD",
      "moneyFormat": "${{amount}}",
      "moneyWithCurrencyFormat": "${{amount}} USD"
    });
  });

  describe('money', function() {
    it("renders base currency correctly", function() {
      rivets.formatters.money(999, 'USD').should.equal('$9.99');
    });

    it("renders converted currency with same format correctly", function() {
      rivets.formatters.money(999, 'AUD').should.equal('$14.28');
    });

    it("renders converted currency with new format correctly", function() {
      CartJS.settings.moneyFormat = '€{{amount}}';
      rivets.formatters.money(999, 'EUR').should.equal('€9.20');
    });
  });

  describe('pluralize', function() {
    it("returns plural form for 0", function() {
      rivets.formatters.pluralize(0, 'item').should.equal('items');
    });

    it("returns singular form for 1", function() {
      rivets.formatters.pluralize(1, 'item').should.equal('item');
    });

    it("returns plural form for 9", function() {
      rivets.formatters.pluralize(9, 'item').should.equal('items');
    });

    it("returns special singular form for 1", function() {
      rivets.formatters.pluralize(1, 'mouse', 'mice').should.equal('mouse');
    });

    it("returns special plural form for 9", function() {
      rivets.formatters.pluralize(9, 'mouse', 'mice').should.equal('mice');
    });

    it("returns singular form for array of size 1", function() {
      rivets.formatters.pluralize([1], 'item').should.equal('item');
    });

    it("returns plural form for array of size 3", function() {
      rivets.formatters.pluralize([1, 2, 3], 'item').should.equal('items');
    });

    it("returns special singular form for array of size 1", function() {
      rivets.formatters.pluralize([1], 'mouse', 'mice').should.equal('mouse');
    });

    it("returns special singular form for array of size 3", function() {
      rivets.formatters.pluralize([1, 2, 3], 'mouse', 'mice').should.equal('mice');
    });
  });

  describe('math', function() {
    it("multiplies correctly", function() {
      rivets.formatters.times(2, 8).should.equal(16);
    });

    it("divides correctly", function() {
      rivets.formatters.divided_by(10, 2.0).should.equal(5.0);
    });

    it("modulos correctly", function() {
      rivets.formatters.modulo(7, 5).should.equal(2);
    });
  });

});

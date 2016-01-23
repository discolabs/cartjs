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

});

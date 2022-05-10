describe('rails jungle, homepage test', () => {
  beforeEach(() => {
    cy.visit('/');
  });
  it('displays the homepage', () => {
  });
  it('Choose a product', () => {
    cy.get(':nth-child(1) > a > img')
    .click()
  });
 
});
describe('rails jungle, homepage test', () => {
  beforeEach(() => {
    cy.visit('/');
  });
  it('displays the homepage', () => {
  });
  it('Add a product to the cart and check it increased by 1', () => {
    cy.get('.end-0 > .nav-link').contains(0)
    cy.get(':nth-child(1) > div > .button_to > .btn')
    .click({force: true})
    cy.get('.end-0 > .nav-link').contains(1)
  });
 
});
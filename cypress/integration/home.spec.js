describe('rails jungle, homepage test', () => {
  beforeEach(() => {
    cy.visit('/');
  });
  it('displays the homepage', () => {
  });
  it('There is products on the page', () => {
    cy.get('.products article').should('be.visible');
  });
  it('There is 2 products on the page', () => {
    cy.get('.products article').should('have.length', 2);
  });
});
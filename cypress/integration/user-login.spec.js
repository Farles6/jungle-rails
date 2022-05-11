describe('rails jungle, homepage test', () => {
  beforeEach(() => {
    cy.visit('/');
  });
  it('displays the homepage', () => {
  });
  it('The user can sign in and redirected to home page', () => {
    cy.get('[href="/signup"]').click()
    cy.get('#user_first_name').click({force: true}).type('Tanner')
    cy.get('#user_last_name').click({force: true}).type('Farrelly')
    cy.get('#user_email').click({force: true}).type('12345678@123.com')
    cy.get('#user_password').click({force: true}).type('123456789')
    cy.get('#user_password_confirmation').click({force: true}).type('123456789')
    cy.get('[type="submit"]').click()
    cy.get('.d-flex > .nav-link').click()
    cy.get('#email').click({force: true}).type('12345678@123.com')
    cy.get('#password').click({force: true}).type('123456789')
    cy.get('[type="submit"]').click({force: true})
  });
});
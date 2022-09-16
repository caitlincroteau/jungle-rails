describe('product details page', () => {

  it('can visit the homepage', () => {
    cy.visit('http://localhost:3000/')
  })

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  // it("There is 2 products on the page", () => {
  //   cy.get(".products article").should("have.length", 2);
  // });

  // it('lets you visit the selected product detail page', () => {
  //   cy.get('product.name').click()
  // })

});
import { test, expect } from "@playwright/test";

test("has title", async ({ page }) => {
  await page.goto("/");

  await expect(page).toHaveTitle("Welcome · Oberan");
});

test("successfully submit inquiry", async ({ page }) => {
  await page.goto("/contact");

  await expect(page).toHaveTitle("Contact · Oberan");

  await page.getByTestId("inquiry_name_input").fill("John Doe");
  await page.getByTestId("inquiry_email_input").fill("john.doe@company.com");
  await page.getByTestId("inquiry_company_input").fill("Uptown Dynamics, Inc.");
  await page.getByTestId("inquiry_phone_input").fill("+1 303-555-0101");
  await page.getByTestId("inquiry_message_input").fill("asdfasdfasdfasdfasdfasdf");
  await page.getByTestId("budget_50_input").check();
  await page.getByTestId("send_inquiry_button").click();

  await expect(page).toHaveURL("/");
  await expect(page.getByRole("alert").first()).toHaveText(
    /Thank you! Your inquiry has been sent successfully/,
  );
});

test("display all required fields", async ({ page }) => {
  await page.goto("/contact");

  await page.getByRole("button", { name: "Send Inquiry" }).click();

  await expect(page.getByTestId("inquiry_name_error")).toHaveText("can't be blank");
  await expect(page.getByTestId("inquiry_email_error")).toHaveText("can't be blank");
  await expect(page.getByTestId("inquiry_company_error")).not.toBeInViewport();
  await expect(page.getByTestId("inquiry_phone_error")).not.toBeInViewport();
  await expect(page.getByTestId("inquiry_message_error")).toHaveText("can't be blank");
  await expect(page.getByTestId("inquiry_budget_error")).toHaveText("can't be blank");
});

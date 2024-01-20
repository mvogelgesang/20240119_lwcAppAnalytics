import { LightningElement, wire, api } from "lwc";
import { getRelatedListRecords } from "lightning/uiRelatedListApi";
import logInteraction from "@salesforce/apex/logInteraction.logInteraction";

export default class ContactList extends LightningElement {
  @api recordId;
  error;
  records;
  displayTable = true;
  displayCard = false;
  columns = [
    { label: "Name", fieldName: "name" },
    { label: "Title", fieldName: "title" },
    { label: "Email", fieldName: "email", type: "email" },
    { label: "Phone", fieldName: "phone", type: "phone" }
  ];

  @wire(getRelatedListRecords, {
    parentRecordId: "$recordId",
    relatedListId: "Contacts",
    fields: [
      "Contact.Name",
      "Contact.Id",
      "Contact.Phone",
      "Contact.Email",
      "Contact.Title"
    ],
    sortBy: ["Contact.Name"]
  })
  contactList({ error, data }) {
    if (data) {
      this.records = data.records.map((item) => {
        return {
          name: item.fields.Name.value,
          id: item.fields.Id.value,
          title: item.fields.Title.value,
          email: item.fields.Email.value,
          phone: item.fields.Phone.value
        };
      });
      this.error = undefined;
    } else if (error) {
      this.error = error;
      this.records = undefined;
    }
  }

  handleClick(event) {
    if (event.target.label.toLowerCase() === "table") {
      this.displayTable = true;
      this.displayCard = false;
      logInteraction({ type: "table" });
    } else if (event.target.label.toLowerCase() === "card") {
      this.displayTable = false;
      this.displayCard = true;
      logInteraction({ type: "card" });
    }
  }

  get cardVariant() {
    return this.displayCard === true ? "brand" : "";
  }
  get tableVariant() {
    return this.displayTable === true ? "brand" : "";
  }
}

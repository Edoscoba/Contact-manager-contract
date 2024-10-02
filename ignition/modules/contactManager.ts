import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const contactModule = buildModule("contactModule", (m) => {

    const ContactManager = m.contract("ContactManager");

    return { ContactManager };
});

export default contactModule;
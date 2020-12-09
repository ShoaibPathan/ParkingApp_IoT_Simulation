/*
 * ioDevice.cc
 *
 *  Created on: Mar 12, 2019
 *      Author: David
 */

#include <string>
#include <omnetpp.h>

#include <virtualVicinity/Adapter/VnetPkt_m.h>
#include <virtualVicinity/Adapter/NetPkt_m.h>

#include <virtualVicinity/Adapter/ObjectDiscoveryPkt_m.h>
#include <virtualVicinity/utility.h>

using namespace std;
using namespace omnetpp;
using namespace virtualVicinity;

class ioDevice : public cSimpleModule
{
private:
    string addr;
    bool state;

protected:

    // The following redefined virtual function holds the algorithm.
    virtual void initialize() override;
    virtual void handleMessage(cMessage *msg) override;

public:
    ioDevice();
};

Define_Module(ioDevice);

ioDevice::ioDevice() :
        state(false)
{
}

void ioDevice::initialize()
{
    addr = getName();
}

void ioDevice::handleMessage(cMessage *msg)
{
    NetPkt *nPkt = check_and_cast<NetPkt *>(msg);


    if (nPkt->getPktType() == PT_OD) {
            ObjectDiscoveryPkt *odPkt = check_and_cast<ObjectDiscoveryPkt *>(msg);
            if (odPkt->isRequest()) {
                ASSERT(odPkt->getDstAddress() == "broadcast"s);

                string thingJSON =
 "{"
    "\"oid\": \"" + addr + "\","
    "\"name\": \"Omnet " + addr + "\","
    "\"type\": \"core:Actuator\","
    "\"properties\": ["
      "{"
         "\"pid\": \"state\","
         "\"monitors\": \"adapters:OnOff\","
         "\"read_link\": {"
            "\"href\": \"/objects/{oid}/properties/{pid}\","
            "\"output\":"
            "{"
              "\"type\": \"object\","
              "\"field\": ["
                 "{"
                    "\"name\": \"test-data\","
                    "\"schema\": {"
                      "\"type\": \"string\""
                    "}"
                 "}"
              "]"
            "}"
         "},"
         "\"write_link\": {"
            "\"href\": \"/objects/{oid}/properties/{pid}\","
            "\"input\":"
            "{"
              "\"type\": \"object\","
              "\"field\": ["
                 "{"
                    "\"name\": \"test-data\","
                    "\"schema\": {"
                      "\"type\": \"string\""
                    "}"
                 "}"
              "]"
            "},"
            "\"output\":"
            "{"
              "\"type\": \"object\","
              "\"field\": ["
                 "{"
                    "\"name\": \"test-data\","
                    "\"schema\": {"
                      "\"type\": \"string\""
                    "}"
                 "}"
              "]"
            "}"
         "}"
      "}"
    "],"
    "\"actions\": [],"
    "\"events\": []"
 "}";

                ObjectDiscoveryPkt *response = new ObjectDiscoveryPkt();
                response->setPktType(PT_OD);
                response->setSrcAddress(addr.c_str());
                response->setDstAddress(odPkt->getSrcAddress());
                response->setIsRequest(false);
                response->setObjectJson(thingJSON.c_str());

                send(response, "gate$o");
            }
            delete msg;
            return;
    }


    if (nPkt->getPktType() != PT_VNET) {
        delete msg;
        return;
    }

    VnetPkt *vPkt = check_and_cast<VnetPkt *>(msg);

    if (vPkt->getDstAddress() != addr || !vPkt->isRequest()) {
        delete msg;
        return;
    }

    EV << "ioDevice (" << addr << "): packet received from SrcAddr=" << vPkt->getSrcAddress() << endl;

    if (vPkt->isPush()) {
        if (vPkt->getParamName() != "state"s || !vPkt->isProperty()) {
            delete msg;
            return;
        }
        state = stoi(trimQuot(vPkt->getParamValue()));
        EV << "ioDevice (" << addr << "): State set to: " << state << endl;

        // respond
        VnetPkt *response = new VnetPkt();
        response->setPktType(PT_VNET);
        response->setRequestID(vPkt->getRequestID());
        response->setIsRequest(false);
        response->setIsPush(false);
        response->setSrcAddress(addr.c_str());
        response->setDstAddress(vPkt->getSrcAddress());
        response->setIsProperty(true);
        response->setParamName("state");
        response->setParamValue(to_string(state).c_str());

        // send response
        send(response, "gate$o");

    }
    else {

        if (vPkt->getParamName() != "state"s || !vPkt->isProperty()) {
            delete msg;
            return;
        }
        EV << "ioDevice (" << addr << "): State request: " << state << endl;

        VnetPkt *response = new VnetPkt();
        response->setPktType(PT_VNET);
        response->setRequestID(vPkt->getRequestID());
        response->setIsRequest(false);
        response->setIsPush(false);
        response->setSrcAddress(addr.c_str());
        response->setDstAddress(vPkt->getSrcAddress());
        response->setIsProperty(true);
        response->setParamName("state");
        response->setParamValue(to_string(state).c_str());

        // send response
        send(response, "gate$o");
    }

    delete msg;
}

module mc.protocol.packet.status.client.ping_request;

import mc.protocol.packet.status.client : Protocol;
import mc.protocol.packet.traits : isClientPacket;
import mc.protocol.stream : InputStream;

@safe:

final
class PingRequestPacket
{
    static assert(isClientPacket!(typeof(this)));

    enum Protocol ct_protocol = Protocol.pingRequest;

    private
    {
        ulong m_payload;
    }

scope:
pure:
    private nothrow @nogc
    this()
    {
    }

    nothrow @nogc
    ulong getPayload() const
        => m_payload;

    static
    typeof(this) deserialize(scope ref InputStream input)
    {
        typeof(this) instance = new typeof(this);

        instance.m_payload = input.read!ulong;

        return instance;
    }
}

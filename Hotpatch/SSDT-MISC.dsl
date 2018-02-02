

DefinitionBlock("", "SSDT", 2, "hack", "MISC", 0)
{
    External(\_SB.PCI0.LPCB.PSK2, MethodObj)
    External(\_SB.ATKD.GLKB, MethodObj)
    External(\_SB.ATKD.SLKB, MethodObj)
    
    Method(\_SB.PCI0.LPCB.PSK2.KKCL, 0, Serialized)
    {
        Return (Package() { 0, 1, 2, 3, })
    }
    
        Method(\_SB.PCI0.LPCB.PSK2.KKCM, 1, Serialized)
    {
        \_SB.ATKD.SLKB(Or(Arg0, 0x80))
    }

    Method(\_SB.PCI0.LPCB.PSK2.KKQC, 0, Serialized)
    {
        Return (\_SB.ATKD.GLKB(2))
    }
    
    Name(\_SB.PCI0.SATA.CHN0._STA, 0)
    Name(\_SB.PCI0.SATA.CHN1._STA, 0)   
    
    Device(_SB.PCI0.IMEI) { Name(_ADR, 0x00160000) }
    Device(_SB.PCI0.SBUS.BUS0)
    {
        Name(_CID, "smbus")
        Name(_ADR, Zero)
        Device(DVL0)
        {
            Name(_ADR, 0x57)
            Name(_CID, "diagsvault")
            Method(_DSM, 4)
            {
                If (!Arg2) { Return (Buffer() { 0x03 } ) }
                Return (Package() { "address", 0x57 })
            }
        }
    }

    Device(_SB.ALS0)
    {
        Name(_HID, "ACPI0008")
        Name(_CID, "smc-als")
        Name(_ALI, 300)
        Name(_ALR, Package()
        {
            //Package() { 70, 0 },
            //Package() { 73, 10 },
            //Package() { 85, 80 },
            Package() { 100, 300 },
            //Package() { 150, 1000 },
        })
    }
}



DefinitionBlock("", "SSDT", 2, "hack", "HDEF", 0)
{
    External(\_SB.PCI0.HDEF, DeviceObj)
    Method(_SB.PCI0.HDEF._DSM, 4)
    {
        If (LNot (Arg2)) { Return (Buffer() { 0x03 } ) }
        Return (Package()
        {
            "layout-id", Buffer() { 12, 0x00, 0x00, 0x00 },
            "hda-gfx", Buffer() { "onboard-2" },
            "PinConfigurations", Buffer() { },
            //"MaximumBootBeepVolume", 77,
        })
    }
    
    Device(_SB.PCI0.MCHC) { Name(_ADR, 0x00000000) }    
}


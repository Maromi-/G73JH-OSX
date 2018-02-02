

DefinitionBlock("", "SSDT", 2, "hack", "GFX0", 0)
{
    External(\_SB.PCI0.PEG3.GFX0, MethodObj)
    
    Device (\_SB.PCI0.PEG3.HDAU)
    {
        Name (_ADR, 0x01)
        Method (_DSM, 4, NotSerialized)
        {
            If (LNot (Arg2)) { Return (Buffer() { 0x03 } ) }
            Return (Package()
            {
                "layout-id", Buffer() { 0x0c, 0x00, 0x00, 0x00 },
                "hda-gfx", Buffer() { "onboard-2" },
            })
        }
    }

    Method (\_SB.PCI0.PEG3.GFX0._DSM, 4, NotSerialized)
    {
        If (LNot (Arg2)) { Return (Buffer() { 0x03 } ) }
        Return (Package()
        {
            "model", Buffer() { "AMD Radeon HD 5870M" },
            "hda-gfx", Buffer() { "onboard-2" },
        })
    }

    Device (_SB.PNLF)
    {
        Name (_ADR, Zero)
        Name (_HID, EisaId ("APP0002"))
        Name (_CID, "backlight")
        Name (_UID, 10)
        Name (_STA, 0x0B)
    }
}


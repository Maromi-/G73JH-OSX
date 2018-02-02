

DefinitionBlock("", "SSDT", 2, "hack", "USB", 0)
{
    
    External(XPRW, MethodObj)
    
    Method(GPRW, 2)
    {
        If (0x6d == Arg0) { Return (Package() { 0x6d, 0, }) }
        If (0x0d == Arg0) { Return (Package() { 0x0d, 0, }) }
        Return (XPRW(Arg0, Arg1))
    }
    
    Name(\_SB.PCI0.EHC1._STA, 0)
    Name(\_SB.PCI0.EHC2._STA, 0)
    
    Device (_SB.USBX)
    {
        Name (_ADR, Zero)  // _ADR: Address
        Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
        {
            If (LNot (Arg2)) { Return (Buffer() { 0x03 } ) }
            Return (Package()
            {
                "kUSBSleepPortCurrentLimit", 
                0x03E8, 
                "kUSBSleepPowerSupply", 
                0x09C4, 
                "kUSBWakePortCurrentLimit", 
                0x05DC, 
                "kUSBWakePowerSupply", 
                0x0A8C
            })
        }
    }
}
From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Fri, 27 Jan 2017 10:23:06 +0000
Subject: stmmac: GMAC_RGSMIIIS reports bogus values
In-Reply-To: <1485369563.7117.81.camel@synopsys.com>
References: <1478189833.4072.65.camel@synopsys.com>
 <a1f114cc-6120-154c-a3f7-3e0389d38e36@st.com>
 <1485369563.7117.81.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1485512586.2693.35.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi?Giuseppe,

On Wed, 2017-01-25@21:39 +0300, Alexey Brodkin wrote:
> Hi Giuseppe,
> 
> On Mon, 2016-11-14@09:14 +0100, Giuseppe CAVALLARO wrote:
> > 
> > Hello Alexey
> > 
> > Sorry for my late reply. In that case, I think that the stmmac
> > is using own RGMII/SGMII support (PCS) to dialog with the
> > transceiver. I think, from the HW capability register
> > this feature is present and the driver is using it as default.
> 
> Yep looks like that.

Hm, so I took a look at what am I reading from
"Register 22 (HW Feature Register)" in?dwmac1000_get_hw_feature()
and was really surprised to see the register value = 0x100509bf.

See bit 6 "PCSSEL" is zeroed which stands for
"PCS registers (TBI, SGMII, or RTBI PHY interface)".

I.e. PCS doesn't exist in our GMAC so most of the previous comments
below should be discarded.

> > I kindly ask you to verify if this is your setup or if you
> > do not want to use it. In that case, it is likely we need to
> > add some code in the driver.
> 
> Well GMAC's databook says:
> --------------------------->8--------------------------
> The DWC_gmac provides an IEEE 802.3z compliant 10-bit
> Physical Coding Sublayer (PCS) interface that you can use
> when the MAC is configured for the TBI, RTBI, or SGMII PHY
> interface.
> 
> ...
> 
> You can include the optional PCS module in the DWC_gmac by
> selecting the TBI, RTBI, or SGMII interface in coreConsultant
> during configuration.
> --------------------------->8--------------------------
> 
> But we use RGMII for communication with the PHY.
> And from the quote above I would conclude that for RGMII we should
> have PCS excluded from GMAC.
> 
> I just sent email to GMAC developers here in Synopsys and
> hopefully will get some clarifications from them soon.
> 
> Probably correct solution is as simple as:
> --------------------------->8--------------------------
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index a276a32d57f2..f4b67dc7d530 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -803,13 +803,7 @@ static void stmmac_check_pcs_mode(struct stmmac_priv *priv)
> ????????int interface = priv->plat->interface;
> ?
> ????????if (priv->dma_cap.pcs) {
> -???????????????if ((interface == PHY_INTERFACE_MODE_RGMII) ||
> -???????????????????(interface == PHY_INTERFACE_MODE_RGMII_ID) ||
> -???????????????????(interface == PHY_INTERFACE_MODE_RGMII_RXID) ||
> -???????????????????(interface == PHY_INTERFACE_MODE_RGMII_TXID)) {
> -???????????????????????netdev_dbg(priv->dev, "PCS RGMII support enabled\n");
> -???????????????????????priv->hw->pcs = STMMAC_PCS_RGMII;
> -???????????????} else if (interface == PHY_INTERFACE_MODE_SGMII) {
> +???????????????if (interface == PHY_INTERFACE_MODE_SGMII) {
> ????????????????????????netdev_dbg(priv->dev, "PCS SGMII support enabled\n");
> ????????????????????????priv->hw->pcs = STMMAC_PCS_SGMII;
> ????????????????}
> --------------------------->8--------------------------
> 
> > 
> > Also I wonder if, other version of the stmmac worked on this platform
> > before.
> 
> It did work and still works. The only problem is we're getting
> a lot of noise now about bogus link status change. That's because
> this info is now in pr_info() compared to being previously in pr_debug().

So it all really boils down to the following problem:
Link state reported via "Register 54 (SGMII/RGMII/SMII Control and Status Register)"
doesn't match status read via MDIO from the PHY.

That's why my initial proposal was to ignore whatever we read from this register
if we have MDIO bus instantiated already.

-Alexey

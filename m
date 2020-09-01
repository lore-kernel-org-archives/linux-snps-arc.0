Return-Path: <SRS0=vI3k=CK=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EFD2C433E6
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Sep 2020 18:41:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65C4A2078B
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Sep 2020 18:41:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yXCMBIly";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="CsBHsOe9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="BdOh4Lfy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65C4A2078B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YWBw0QX9svN7bJybpZRSJ/LDxbXh/4H/vY2RuBvdIXM=; b=yXCMBIly+03eb7+X6BVPLYE+W
	aUszY/ynKgNHQmyT1eMhCRGOEHixjzltV/QQcVB5bbiQn68ti1pfqLw5q0SaFWXB66QPeFSzT+hns
	L2oyzEa7i6LkjuqH4MRXQ3ep9ZzlPs33Mnb92xlHFMOl9aw0PoAjHNoiHx2Df/2bFU/V8UwJ/uSo7
	SfgsOKtqiGC9vxciQnT7tYhiwMRiiSXAB1AuSHhUHJSrF1uhCdFO0e39QnFv3SQMxz5ge3nnns9L5
	rHh92/fFjUCVc+zCCrCqBrHK8WR/2yTfplFjZpIRG62DU0SmKwG5+jJcKsCU+dUM7XyOsL4vOCqPq
	cKTYnceOA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDBED-0006n8-MI; Tue, 01 Sep 2020 18:41:57 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDBEB-0006mf-Je
 for linux-snps-arc@lists.infradead.org; Tue, 01 Sep 2020 18:41:56 +0000
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com
 [10.192.0.81])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 34802401AD
 for <linux-snps-arc@lists.infradead.org>; Tue,  1 Sep 2020 18:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1598985714; bh=sObdYge12KSHIz6nGtSNYdqTFW9ybR6ltkmaFTC+14E=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=CsBHsOe9gEZAoaPQgdFVKFn7o9qHmS6/hK4V//jT8DICGu6pdgKa+4WBEwpVl+DmI
 RjI+/4C22xDBOMeP+L9U/g2KGGNrvad78CLnc+/Amd/iDEzLz1Ap6SnJG+NfurxDM0
 mtWYWyu/PtaYGEzKew+KQJ9gpIt9ea0HGFeOGfwZZzs3EJGXqjg5nxb07YQIshXtnQ
 3VNgzJFw6RZPRD6pfQbA6g02AC+Ktv4hWQ1ibunjcJenoFyn15vfkHWSnWWB9KPT0v
 HTBh0v5uF0lQh6H5TgclnjCoxesQqHyAOSSPKv/rVc4e7fxFvRv26vCZ9U9QX3HFHp
 t5c8v8rTS6bng==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com
 [10.202.1.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 23449A005C
 for <linux-snps-arc@lists.infradead.org>; Tue,  1 Sep 2020 18:41:52 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2107.outbound.protection.outlook.com [104.47.55.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id CB7B3400BB
 for <linux-snps-arc@lists.infradead.org>; Tue,  1 Sep 2020 18:41:51 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="BdOh4Lfy";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fHbBEOYmgZ5sWYBVIJGGZ2CIjAZGy3HfvanhI82ZDvlC1UX11egkTw6gxj7Ys0GMPlHxJhQJhmYwxnCOcIHgAesT+yTyKVNEPyBJukMUTVoTdwCaFl1DrGQ8ZRePqkFOVXlXpZVW4RZXSW2h2Rcpj14MzbtWp0+IhFYl92hNPabunAkC75R/ljoTIxI2Xl7dSpjLGqoBohmKowuEMbLR7mjfU0pnOPj5ASrFfApwVFCSGn3fjiw4Pcwdw7jncsdB3MIpE7DWhhelyKdxT8aCjpGWYS1UbYeRomqzn8L/8apAEltH3V1qrpThKoOm6Fu7l1Jq383MtJqwJhaNIPH0FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sObdYge12KSHIz6nGtSNYdqTFW9ybR6ltkmaFTC+14E=;
 b=d/hqQN9cbbASaVor64WZwP+/D99WZ5yH16mtUTdx5BNmxKGw8hfk61g3Mno1Ot+b7fRCwuu1jpsGDyHuPap4IxUQ8BHWnSej2G+3G05tu32rUKmf5DG+EXNBpKM8DnqKSZ64OEFNis1GCmqioxVN5gkLHCvWArh/IfCX0Jo8j5D48AvRvI/nPCyaisA4UEh+BPtD7qBQ3Eh+BQWzae3DLQdedfbYxH01zyEa1HWtu8LPxCVA0xT8IO1gPRPxJ6DkGAY1ytD44arcrGoLiflPgiq6FD5fVfjJOkChIfVkZkjcTnaCoF9xiq4rVyFTDhlemGEnCTlykK4ZyCdCi7yyEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sObdYge12KSHIz6nGtSNYdqTFW9ybR6ltkmaFTC+14E=;
 b=BdOh4LfyJA5kWlXtos2XTt1OKtujxY92dQPgehq0ui59PYy36nix8lI22it38fadln6S3+BmBTuFm24Ac1uqee7cUbt4ruQy6dip54Ifj7RhZXa/4fcfUnQEdiw0c4XnG4LQs4pI1kQSnfqjyqK0ylLtbnweNrG+L2rqddVtah4=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BY5PR12MB4018.namprd12.prod.outlook.com (2603:10b6:a03:1a7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19; Tue, 1 Sep
 2020 18:41:50 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::19e1:33b2:5f25:5c5e]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::19e1:33b2:5f25:5c5e%5]) with mapi id 15.20.3326.025; Tue, 1 Sep 2020
 18:41:50 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Evgeniy Didin <Evgeniy.Didin@synopsys.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Subject: Re: [PATCH] ARC: [plat-hsdk]: Switch ethernet phy-mode to rgmii-id
Thread-Topic: [PATCH] ARC: [plat-hsdk]: Switch ethernet phy-mode to rgmii-id
Thread-Index: AQHWVHTKgUQfWaUBnkmX+PhRdyxHkqlUdjCA
Date: Tue, 1 Sep 2020 18:41:50 +0000
Message-ID: <5ec34714-3a9b-be13-a702-d2cd5e6c2eba@synopsys.com>
References: <20200707153858.13280-1-Evgeniy.Didin@synopsys.com>
In-Reply-To: <20200707153858.13280-1-Evgeniy.Didin@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: synopsys.com; dkim=none (message not signed)
 header.d=none;synopsys.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [2601:641:c100:b9:9593:5cb1:ebc3:8ee9]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8a6ef019-3a97-444e-d445-08d84ea6b063
x-ms-traffictypediagnostic: BY5PR12MB4018:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB40181735F7FAC8349D06E68FB62E0@BY5PR12MB4018.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:159;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: liqK2uf5+Up5meCT/AT3SfS15XC5BXuO+qnx8+eEfG5Kbiafsm2+Azk1lufSECcUFJZh+OxFr4szmkGv0gL/C0gpLxuzdrpdG8H9nxRkaEOgt8neYieuLjGYnFDv/UNhbWSTnxSU9s4wB/D4rNQuPb2DzRRLb94EP/IWshJlXNGCUN71mxBblPTbcKgwsX8STnVHbJV5R1qWx0E4PcKaF44cT82U8TJlCvxAmSSaRRyU9yiMWhcMnwjiY4xzCYzCBGfatCLF6/8XmQWXjte4TqYioC2r69UZOlysi0781+WtUla5GkELwasjiLleClkS30Swt2gJPVU5EhDkoVzHxGdIBvLEpixilobD3qhbYwnsFCrEK6u91yE9iyF0/rs9
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(366004)(346002)(39860400002)(136003)(376002)(36756003)(478600001)(186003)(31686004)(86362001)(2616005)(6506007)(83380400001)(4326008)(107886003)(53546011)(66556008)(8936002)(110136005)(5660300002)(316002)(6486002)(2906002)(64756008)(54906003)(66946007)(8676002)(6512007)(66476007)(31696002)(76116006)(66446008)(71200400001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: AITEhBYqHcDfuPBjJyq5KJCrfVrqclDNN8KAr3xHeJ0x1tGJa9gLrbRezmPiXzdpnpCchTVExmko3MVqY//FF3/swsTBRoql7uFvmqj6T8HhTf9FWID22TA/4Invv2DFlgRvtuD3+smo+G8miTDxTk7F6L61n/VMEHgqQuNc8TIHQhVaseatPYIH04OXNinxVHXlqwRmeE35E+eYhVj+MTJ0wV+X+ODAxqaZ/1psuENikVLOgPY73/c+jqQnMIL1W3SorNLSesP/5aUC3HhlQU1WRmEJw2NDT/vtIo9aEhU5FPqlscu6lYh6XRII3xVy0xjH4+4n65bDai0mxkkSwK2aylTkrMyoafmdGDLa8tI0W8UxNXGu8yYSHtbdlLjUUwZ5oUucUiFepjswEZeCUXwz9f+3FSYFg2RYUCLv0l5ito9tmdnNtG8JdfCIMHNLOvWHzv3i15pTWHdTkmyorgl8rGYgouURBFprDp1Qqwi5ygIcac5BgP3W0hm65NYrHaq+o/asnNwUpL+kWyQ5pbdc8gGD962GIosslraVSlS2Urct9XuIGh8xxdX0TUoJYuUhPPb8Jjt+EWe4faI8s8WjclD9t/WBPOLk7T+kFX/6BkoqCY8m68oW/hKIS9o+hsfweednK3Cv+rIDIFAndLNLt6ATLz2qdEzTlMm7fw/cyDqz7YUgDNevExDCkcP3HqGVbjGOpeIr4pF0ULvpLQ==
Content-ID: <EB19321956FA474C82813926F0C11973@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a6ef019-3a97-444e-d445-08d84ea6b063
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2020 18:41:50.2426 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K2zTAIRFUB2ny6LOPuwlCnunZ9D5g4nhOAFDzuodc9rFw5ArhNVjQBk80xy0hs7WVhZH42PrHZjbxZRE+Bqkzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200901_144155_917551_5E3C86E8 
X-CRM114-Status: GOOD (  21.92  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 7/7/20 8:38 AM, Evgeniy Didin wrote:
> HSDK board has Micrel KSZ9031, recent commit
> bcf3440c6dd ("net: phy: micrel: add phy-mode support for the KSZ9031 PHY")
> caused a breakdown of Ethernet.
> Using 'phy-mode = "rgmii"' is not correct because accodring RGMII
> specification it is necessary to have delay on RX (PHY to MAX)
> which is not generated in case of "rgmii".
> Using "rgmii-id" adds necessary delay and solves the issue.
>
> Also adding name of PHY placed on HSDK board.
>
> Signed-off-by: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
> Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
> Cc: Alexey Brodkin <abrodkin@synopsys.com>

@Alexey - u ok with this change ?

-Vineet

> ---
>  arch/arc/boot/dts/hsdk.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arc/boot/dts/hsdk.dts b/arch/arc/boot/dts/hsdk.dts
> index 9acbeba832c0..d6427d47e5a1 100644
> --- a/arch/arc/boot/dts/hsdk.dts
> +++ b/arch/arc/boot/dts/hsdk.dts
> @@ -208,7 +208,7 @@
>  			reg = <0x8000 0x2000>;
>  			interrupts = <10>;
>  			interrupt-names = "macirq";
> -			phy-mode = "rgmii";
> +			phy-mode = "rgmii-id";
>  			snps,pbl = <32>;
>  			snps,multicast-filter-bins = <256>;
>  			clocks = <&gmacclk>;
> @@ -226,7 +226,7 @@
>  				#address-cells = <1>;
>  				#size-cells = <0>;
>  				compatible = "snps,dwmac-mdio";
> -				phy0: ethernet-phy@0 {
> +				phy0: ethernet-phy@0 { /* Micrel KSZ9031 */
>  					reg = <0>;
>  				};
>  			};

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

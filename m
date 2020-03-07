Return-Path: <SRS0=vrW9=4Y=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B357DC10DCE
	for <linux-snps-arc@archiver.kernel.org>; Sat,  7 Mar 2020 00:37:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79DC820637
	for <linux-snps-arc@archiver.kernel.org>; Sat,  7 Mar 2020 00:37:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FnlbmJf2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="P3az9jVo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="hP7d9Oel"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79DC820637
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e8lVFIIjTgT/+FiDtD1X7dgnxZqPa+yi/MDdbFmuWx0=; b=FnlbmJf2t9Kp38
	6HxWbc2A87XL3dS9EYIYKS/3oWmkQ45OoUsjxCwRfobVLYbZhAIAWBlH7NBvxyMCCwL1ssQ9TwcU2
	xTz9CZOZ0YWLyB1GPEW0Mt/AqiuDrJkrrFrzr/V5Nu227peUQa5+yG9iAr7kGezm8CtSJa+aY6vdg
	frZiV195EGezPOxcwbW6Co854iFLYrVOBkTPG0kT50H1deosW1r+JUi7XaV+vXTPCP+y2FNr1rV7z
	wh2bJaaWLQ7tghO/XwNXV2F8xorIhoIkRhbvNbRF8H6qXf9K/5uft6o2/URBrSW2+UNZkJL5lhDHc
	7FazMFZjS7an4M7SWoHQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jANT3-0006Gt-9b; Sat, 07 Mar 2020 00:37:25 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jANT0-0006GE-HK
 for linux-snps-arc@lists.infradead.org; Sat, 07 Mar 2020 00:37:24 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 0FA1C40217;
 Sat,  7 Mar 2020 00:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1583541442; bh=jCP8DX9trspltYrF+Izv2tD5yHoM8rn6M+u8cvti/Qk=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=P3az9jVoYwBFjyrkVyW2DPecoWbuXux5rBrNapsKueVvoJag32+l19jSLRCcQEcMX
 XKA4f2h/mA034hQiAR0Paicu02feuNAxBtRf+7INRDP6laFV9Vl1Zlm9H6tTImCd+P
 rTnvSIdLZKccVj8C7zF/z9ZrAL6iCWOSFI68keRdOHGB4r0L3CVJMNXrOV5s58OAfE
 TKDj/bYc8V0QduTQSwoXD3xRctPk8/gAvdoCZIQVtPbb3f0ELU7skDs01bXRMcadHV
 fvE4rfIMlpHX3e0HJiiyhm+mZONTHGMbpWLe+j5eltNyoKaQZPNS96b+QDiOV3y6El
 +Gma04Q4JJjBA==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id BBA40A008A;
 Sat,  7 Mar 2020 00:37:21 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 6 Mar 2020 16:37:10 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Fri, 6 Mar 2020 16:37:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UnZFEMNtKWcHfh85d8r+yH+7tPLQJMWU0B+DHXzLqULBEr/c+BQzy0fox8dDWnm8VRVbdBcanNomNWOrXlS6JYXb1VIutC9UWqmKxYtxpKHi62itx+2QEoCveEcCXMpopGPLwXvgh28hSUhtgmxVidbRqqyNa7JNro5r0RHXulVEQWEd9fg49o7IaOeXLdV7e2Y6p0w8zf3d9jhziCoCLZV+p/LM23aTwvhzCowyZYktnKAYRo0uSKxe2u+hA0PJCEdtEasOpdCcoG4oGPrN25QgBCkYcGZ3M82oHjy0hL5U1QUul7uikfjXt/Hi96ktWDWOkWYFs78EjGmMuAseXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jCP8DX9trspltYrF+Izv2tD5yHoM8rn6M+u8cvti/Qk=;
 b=B041m1R3+jDKokHFDOGZVgT9HyFSk96dqSs66tIy9xmUKFlsqoXQqR7l55FHbqcqhFzk9mprAwql+e5+djo7+XfmsckV+KOWZqMQ/E4Wfc+aXEFfl9rY/RKdhIrKSTN5vu79KGcxCNfg8oDuWg0nDFdwOjwVDmOcIi2JYPTS5wNOD1r6b30y0eK7h3iMAw/QvOzQEy7xQNUSw/6d7BfChcRbz53StyctRPDHbSZ9wXMKaxzwTIFECBhhw5oekypmrtBba7L4krHlkzMeuTWj5yEDxh1wHsUAPRPg1QJG4vmp8mYvbK0fGZ1AINL/QDDJ6IAxn0+glf2bWkcSPo/duA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jCP8DX9trspltYrF+Izv2tD5yHoM8rn6M+u8cvti/Qk=;
 b=hP7d9OelEh2n0U5G7zEEa+DGeqyDLZLRgcO9Ptwi4t8SYnXL144oPj4g3z5FLaQYIYHqOMbh2//QIlsCsRYkXGonSqyppvbktdMgtz0o6ini6CvIxZc181Xt1YaIfLGbCbGKC/7QGsvDlOTn5iO0CegdClYeAwkXv0pHlQH0erg=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (2603:10b6:a03:db::25)
 by BYAPR12MB2984.namprd12.prod.outlook.com (2603:10b6:a03:da::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.15; Sat, 7 Mar
 2020 00:37:08 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7%7]) with mapi id 15.20.2793.013; Sat, 7 Mar 2020
 00:37:08 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Joseph Myers <joseph@codesourcery.com>
Subject: Re: [PATCH v3 17/17] ARC: changes to enable 64-bit time_t, off_t,
 ino_t etc
Thread-Topic: [PATCH v3 17/17] ARC: changes to enable 64-bit time_t, off_t,
 ino_t etc
Thread-Index: AQHV8+SKpTHoZcH0+EKw1MRnffKmBqg8RHWAgAAE0AA=
Date: Sat, 7 Mar 2020 00:37:08 +0000
Message-ID: <2e734388-b9f1-1e56-17c2-141acd87abe2@synopsys.com>
References: <20200306182419.13945-1-vgupta@synopsys.com>
 <20200306182419.13945-18-vgupta@synopsys.com>
 <alpine.DEB.2.21.2003070016420.26274@digraph.polyomino.org.uk>
In-Reply-To: <alpine.DEB.2.21.2003070016420.26274@digraph.polyomino.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vgupta@synopsys.com; 
x-originating-ip: [149.117.75.13]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fdd34856-2f53-4286-dde4-08d7c22fab3a
x-ms-traffictypediagnostic: BYAPR12MB2984:
x-microsoft-antispam-prvs: <BYAPR12MB2984EA4A4DADC774C256FC66B6E00@BYAPR12MB2984.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 03355EE97E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(136003)(346002)(396003)(39860400002)(366004)(199004)(189003)(2906002)(76116006)(6486002)(8676002)(81156014)(81166006)(31696002)(71200400001)(6506007)(53546011)(966005)(86362001)(54906003)(8936002)(478600001)(186003)(26005)(36756003)(4326008)(6916009)(31686004)(66556008)(66946007)(2616005)(6512007)(66476007)(5660300002)(66446008)(64756008)(316002)(533714002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR12MB2984;
 H:BYAPR12MB3592.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rbHxEZCaa00sKqnQCH6Wd57pLPvnLxoxSz8XjmJ4vTYe3a1gqcsxubV0LKhdfs3GpC9tZhB9BLHieQez1Jow6XW6jZaP9URJY2WMBmNUTYckuxmjXP5BjRFvpMoz0UlnhF/D7QG8dXBAJ7J1LthmGO6HA0lQZInGBWK4drvuTPC8VJqsnT6UIeiXf15SU3r7XeFKSqrfOVIWUN4N7wEE1rqSrVmKlRjrAzyz2BIEgLlCbDPxVeg4aXzUn3Tb+TK4IxOsiZwlhaRHfA6se9V1IkM7lLvXne7mo6lo7YW/FGb5iphGWYlsEF4CDqwzG3gGqHoOZdUHMwP/bZyKffs0SvQ5EW4T/JsWq9uyX7IGKeoobHD+if7OcmOwj1ETr7pNmcHS4UMhl7SaV2/WvDw+pColvfv4S9WzMgQ5YsLELIIPIaY9bj1oD40D8Fc5bEGsSRlUfB8Ycs2K+F0haH4SaBYu/vVrJlldiK6LkHUSBPFiezLMRhQMQZHzfsHYVbxZdaAk15Y58Ze+JroH8V6jEK8Kxzl1U9oW6wGbFcHFuCsYhKc6vvTpd5a91sAT4MF+N9b/fKQMKryfAIlKaWNseQ==
x-ms-exchange-antispam-messagedata: SZEUhs9I+nsdmI3I5eCNgh+f3zsRZ2gppJ0Ul+A2N3ywR3GxpAElTQCl0FzPitaeRnDA/Eo27N3wguXTbtriUOr930yLCl2W4W6hdLDq+vCwwsunrpeeIZRqn0Q3eKeuEihZi9H4dzOBhNTC+xwEWA==
x-ms-exchange-transport-forked: True
Content-ID: <078E3609E8526D48A409091C3704EB71@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: fdd34856-2f53-4286-dde4-08d7c22fab3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2020 00:37:08.6778 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PiBxK5TWQowFkstpWW7LfA9tzASIF1H6DLiOpcN+yyaIyywKxbEkYNfPe/8w6xEtZWA36Il7F43FeAkpm6yPpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2984
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200306_163722_581694_2B993448 
X-CRM114-Status: GOOD (  17.28  )
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
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 3/6/20 4:19 PM, Joseph Myers wrote:
> On Fri, 6 Mar 2020, Vineet Gupta wrote:
> 
>> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
>> ---
>>  .../sysv/linux/arc/bits/socket-constants.h    |  4 +--
> 
> There is a general principle for patch series: you should not have later 
> patches fixing up things that were wrong with earlier patches.  Each patch 
> should add files in the form desired to be reviewed, not in a form that 
> gets fixed up later.
> 
> (Sometimes a patch series might change a file that was correct in an 
> earlier patch in the series, as part of adding additional features, if the 
> first M patches add feature X and the next N add feature Y on top of it.  
> But that's not the case here - such later patches should not make 
> incompatible changes to earlier ones.)

I agree and you've mentioned this fact before as well. The only reason I carved it
this way was to ease my testing. The 64-bit time code was based on RV32 which in
turn was based on bleeding edge upstream some of which needed additional work for
ARC but ininitial days of 64-bit work, it was hard to know if the fix was needed
for 64-bit or for upstream tracking. And that's exactly what I got bitten by -
when I missed the fixup for init constructor invocation from Florian, wasting 3
days [1]

Anyhow that's just to give you the context. I can split them up and add to
respective sections for next iteration. If we end up not doing another iteration
- hypothetically speaking :-) the whole port is anyhow committed as 1 patch so it
doesn't matter.

[1] http://lists.infradead.org/pipermail/linux-snps-arc/2020-February/006974.html

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

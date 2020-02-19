Return-Path: <SRS0=t4uf=4H=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8756BC34031
	for <linux-snps-arc@archiver.kernel.org>; Wed, 19 Feb 2020 01:31:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58E3B207FD
	for <linux-snps-arc@archiver.kernel.org>; Wed, 19 Feb 2020 01:31:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R5AxOjLU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Eyjqr/4z";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="YDarELH9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58E3B207FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QJLnyJ7CLbDugve7QeDMf5RyL//sxELLjb5vGYtkUGo=; b=R5AxOjLUR8NEXY
	Xvh7HHEIIrmq44I+0QAZOiHC2cUl+JuAkooSfDRelPgaLyh0Nc8jcxDhjtmcWfUHsooOe0iw45JFc
	zFFnX4VFw/25CxFLDZkds/J84VRilov4kMIoKIw52VBYgyHoiwBYOqoISDBCOpYpstFkjkF1RzRqn
	/x+AGJ21xe8aGORVqgK4bHfmxdjNQ17IhkKQ3+gGY5vWDLLRALeujkeeQvBqmkwGYGRA1htXvWpKH
	S6NcUHEM1ZCPYb7Qr7r6nD+l2MvXeuQvNVFDbB07azdzV9jxNrQuwAGfgVd32mok8sIBq+g4sck6V
	3ZMSA9jeTsJTWp3FOLrQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4ED5-0007aE-Ev; Wed, 19 Feb 2020 01:31:31 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4ED3-0007Zu-Bd
 for linux-snps-arc@lists.infradead.org; Wed, 19 Feb 2020 01:31:30 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1C781402DE;
 Wed, 19 Feb 2020 01:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1582075889; bh=fE4A9GUonCNRE2SXMSjG2VK2ewz2YJMDf8oJwD+Mo74=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=Eyjqr/4zxk5dFpfXGesn2W7DoU8paKnyn9BnouKddG06ND1eLkWxBKfQ9O40ILEKH
 dC3OZncQp+UkL3isbYDhqui2Mi6X55UFRkO/tznWE3eRm/lurB8MltcHzE+PF7LHQg
 ypNkAacDX1RWKRMIZ63V7id8toXAZoSNh1dFDi2szyt00BtsMnpDULErDrYFuQzZtR
 3MZFcn9XPWVFKnxrwE2f1l1JdTDw1IR677umiio+lxPV6EVb1nLlj1f9wa9KZrEDbz
 XmOg3KE3v6u6/H1n4PRfRsRd1YKoUPMpG8HzdHLvBqtgYctLY4k7cLCerMbuVhTF38
 fm62X6gK0pWYw==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id A2235A007F;
 Wed, 19 Feb 2020 01:31:28 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 18 Feb 2020 17:31:13 -0800
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Tue, 18 Feb 2020 17:31:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bUi3Nzgs5bAF6fLZqnWhyatRoox4/UDmuGUscKtRhZxQeqEGOmPYiqEk/TyAc5swun164WE/Qc5FsnUlorrrk5vOK/738z5xoJXYAIDRaeiFVzrtb6PYE2qO0rXR+nQqJ8xWltjkdkmmK+srfq7blJfJmYf9gplOv3WAQW1g4aAAz3AdNoE+vbFuinBmS2PA0JpLbI1UOh6PseExgdPqaEr7rjIhSoJwp9Igp0ym5bUFgqmL+GKxSU+pcCIT4ktaTAXHZnTy3aWCMyrln3o0Ewh8F5Ya6PwX3xFIya5ACZqScNnnW/tRKeU5q6j/cBdiHqbnTl+1hgk9FsjoruyJsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fE4A9GUonCNRE2SXMSjG2VK2ewz2YJMDf8oJwD+Mo74=;
 b=IcEnDd14pgKBZEcpTtm2Km4g9FIOaplQvw60UjrJW08F18dc/8vDry3gfHCUE4Nr06QlQtJk+AL05ka5JeVkx4W/CxqDPadu3ICxRlrHtQ2TaiX7SriJbJdX1uGQQNBKoS3taxCRdxTw2a93Nq5wnLZxrP7GTZpUY6u0qWhO5Rf8+TII78dp47nv0MBkBgc2V5CG2tjNVxc7CRCWbydT7WdRFJIXjNQGDeKW2tzJdO730FcWrBgCO93T28pgQcql6ByippMGmTq6VPx5woBuPHoZdj3KP7RgXnbFCnOUqIRQYNFTHK3eU2IcERbNXhXTa12LNIZqdpWbMNWMnTVImQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fE4A9GUonCNRE2SXMSjG2VK2ewz2YJMDf8oJwD+Mo74=;
 b=YDarELH9sKeQsLIES1aJqKBUagBKBICZnLVXmKbglqtkV6aqZIymyzc6tiCH5XMiYVI/0TNociHgKocTXs4JLRjyuEPjf+sGvvvSt+LUzfqrui53d5aw9TL84r/bFSJBuymgIyGDSlA4847HLqlU4zleih/UnuoKntCD5ydmumI=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (20.178.54.89) by
 BYAPR12MB2838.namprd12.prod.outlook.com (20.176.254.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.31; Wed, 19 Feb 2020 01:31:07 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::5d03:e088:d949:7f24]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::5d03:e088:d949:7f24%7]) with mapi id 15.20.2729.032; Wed, 19 Feb 2020
 01:31:07 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Alistair Francis <alistair23@gmail.com>
Subject: Re: [RFC v6 07/23] RISC-V: Use 64-bit time_t and off_t for RV32 and
 RV64
Thread-Topic: [RFC v6 07/23] RISC-V: Use 64-bit time_t and off_t for RV32 and
 RV64
Thread-Index: AQHV5r98yBwAtZ909UCZTNuzjj/4mKghs08AgAAHuoA=
Date: Wed, 19 Feb 2020 01:31:07 +0000
Message-ID: <c9f11e9e-7c33-0000-e32c-346d425d7c69@synopsys.com>
References: <cover.1578824547.git.alistair.francis@wdc.com>
 <4e95f95966d8d7c6a8339160dc62d81c1f6a1bfb.1578824547.git.alistair.francis@wdc.com>
 <67f2298c-30ab-1508-4a10-6ee285df7ad1@synopsys.com>
 <CAKmqyKO6u15cDbQQ644GrABi=6WWQsNLiCVLszrmDCdcWBnCPA@mail.gmail.com>
In-Reply-To: <CAKmqyKO6u15cDbQQ644GrABi=6WWQsNLiCVLszrmDCdcWBnCPA@mail.gmail.com>
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
x-ms-office365-filtering-correlation-id: 16cd0b89-15a0-46b2-41e3-08d7b4db64da
x-ms-traffictypediagnostic: BYAPR12MB2838:
x-microsoft-antispam-prvs: <BYAPR12MB2838B37738BCB2E0882D3E69B6100@BYAPR12MB2838.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 0318501FAE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(199004)(189003)(4326008)(31686004)(6506007)(66946007)(2906002)(26005)(6916009)(5660300002)(4744005)(53546011)(66556008)(81166006)(81156014)(66476007)(54906003)(498600001)(6512007)(7416002)(71200400001)(66446008)(64756008)(76116006)(8676002)(31696002)(8936002)(186003)(86362001)(2616005)(36756003)(6486002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR12MB2838;
 H:BYAPR12MB3592.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ah9nmyw5jKBeY2/hBo165YBErMFJlMyLxgGsXVeb9aaRA6WVULrlQ7T7lEPAE4mbMzC8zb21PcezQAA/ZJcXrxsTYte1e4JBhxBXHyxUMp6ZuVSTAjzJMa/0rLDW+oOoCWsvpFov+yi80HTZOE6M0+E3aPgeyKk2SogRg82jhUd3OzvBYV9nmiczU58zlcLFYYSmTUP1Q73zCa4A6VXGCd4GRaJZubEdGVPltx06pezswoua5oBlGmmiFXc5zDRbl060M48c29K8hxqUiREmcT2P1Zkcm6ULsWnoZU75LrOR2NLDnW1m5aLgUmfSl0PiduyMayUVBfEKgkNKqzANQUOIOsHTHTyUzxWcrikEtkIDw5UoUXDwHDJWAzS6mbwzA1Gph11HPxcfhA4VegIyQKBGOqMbZcSpJZY5cA8yoe30dQXfwqeRhwK+lWflQZfU
x-ms-exchange-antispam-messagedata: YzKf+dxN717F4AEP0/QsW5HNsaUOLdnrowlrHAdzGyGgjNX9nkJ1Aya+MCLWq05l4LV/S25bkdRulOdEfwzTw7pLFYVoXsPbQ0TP9uAb9H9t6mZ2TvgQCfXJ9Ra2GXSafRtNE1iF+lKG1wzM7DkA+w==
x-ms-exchange-transport-forked: True
Content-ID: <28920EDF31FF6B42A0954C1A9DE4BECE@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 16cd0b89-15a0-46b2-41e3-08d7b4db64da
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2020 01:31:07.7338 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tQ7MsWxsSxvIIF71ZzPl6pQRw47dcFmnlBdiecnbNleLkYKLtb9/fPVBiY1MD+NLqupEYweXNL/QWnp/zvI/1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2838
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200218_173129_407334_03A8CD16 
X-CRM114-Status: UNSURE (   8.81  )
X-CRM114-Notice: Please train this message.
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
Cc: "fweimer@redhat.com" <fweimer@redhat.com>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>,
 "arnd@arndb.de" <arnd@arndb.de>,
 "palmerdabbelt@google.com" <palmerdabbelt@google.com>,
 "zongbox@gmail.com" <zongbox@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "adhemerval.zanella@linaro.org" <adhemerval.zanella@linaro.org>,
 "macro@wdc.com" <macro@wdc.com>, arcml <linux-snps-arc@lists.infradead.org>,
 "joseph@codesourcery.com" <joseph@codesourcery.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 2/18/20 5:03 PM, Alistair Francis wrote:
>>> +#define STAT_IS_KERNEL_STAT 1
>> Isn't this irrelevant: seems to be only used for legacy __NR_stat/__NR_stat64
>> syscalls based__xstat()/__xstat64().
> Is it? It seems to be used in a few places, including:
> 
> sysdeps/unix/sysv/linux/fxstatat.c
> sysdeps/unix/sysv/linux/xstatconv.c

AFAIK that is not part of the asm-generic syscall ABI which ARC, RISCV et al use !

-Vineet
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

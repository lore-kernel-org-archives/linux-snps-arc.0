Return-Path: <SRS0=Wyqd=AS=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9176FC433DF
	for <linux-snps-arc@archiver.kernel.org>; Tue,  7 Jul 2020 18:25:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27B4F206F6
	for <linux-snps-arc@archiver.kernel.org>; Tue,  7 Jul 2020 18:25:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="y2MifdvE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="E5Bd6pwS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="N7RnSnYk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27B4F206F6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1uNAnJNXn5q+0XVAhCMpEVs7a6mI1I0QNBA/o5bkcXE=; b=y2MifdvERK8DRysbPsVk8aVzF
	Rpaz0KxxXS3zp1bPXUZVZZSxCMq1eIG8mGej3SU8BUATFIRSmIy1xjxiZrgnprRm7B6qAxnrnGMUt
	cXp7iNNmLjH4KSsCDp2Mxv7ZBSFEM8+TSqSKc2EquC0AGbaXxh+B3Utr/HyAfw3HqKvfIFM2o4Se0
	EErSm/zc59juzwPW8dy3hbwUhUNXBIfoEAgd3xRdPt12kx2xHzUYt3EIL9PnBTzy9yW9JwXo+9y6R
	aftT6cBCLCBNkOsjyog+kDmKqjFpE8C9/wdxhV0hsht1W40ArSS+cCyWq9BdKaeNdi/xqAA01X/bq
	AcayqJZ6A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jssHu-0008DN-HY; Tue, 07 Jul 2020 18:25:50 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jssHq-0008Cj-Ct
 for linux-snps-arc@lists.infradead.org; Tue, 07 Jul 2020 18:25:47 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A71FC4014E;
 Tue,  7 Jul 2020 18:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1594146344; bh=bdpXFcyxuH2CXBVC2zdU+uUUIUd/Z1qrCcfApuFQ48w=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=E5Bd6pwS/3aH7b+VUQtQDkV6KbdWU4ew+rsF4EVKb80zQgmdfTSetTYW1FUsRSiOf
 mwBGi/MG8V90zD9DF4n93C3SZ0blBHcefbro4e1OEylgQzvBnfvTrUKlOH+yq8Kocq
 OI4vCPzyFKtLmCClnLZhasDyYXamSeZfhZL64SE7EvS8fm1DctJ1SpepPbq6LhymY8
 95d2xdqtmOkVz9FOjXGy3pW09hSTDPv1tJB1HMGrYeyEitUe/PiuTM/u0fo3IcQ2zd
 8W+kP7k1j8fbjua8OySrW2nfibKzFKxrawsQ19s5bNxhYra+oVJJI1MjxZHQaQg8+l
 4N6ZUd2SIUhNQ==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com
 [10.202.1.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 5F597A0071;
 Tue,  7 Jul 2020 18:25:39 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id D2D814013F;
 Tue,  7 Jul 2020 18:25:37 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="N7RnSnYk";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E6mLa004ZBHUtYBNqVjA+pbiUvCYlU93GA6hSEUutxaJVP6JEIB0141ZVcHo1cXCbgssxMoPApoZe+mN6nFVK5iqvUEKcIG721VhFZ2yh/ifrWdoeNrLfvFsn4Lzjcw735RfujOwjvFbTGW0c9gJJKX7/xFl05VNbxT2RdYwQEX7z2G337fHBms/pMRV0gIp8xVYrjtL95AzAH/EZi7SHJ89wR6aIOa4h/NveDqJQuohe+DsLK56603f6lNzunA8OmyOoD+c4Rz1yyfQypU0EIAAUDZSglCgdHwIVAclrfOJYM1GzbmKwZB+Qy57EMhBwlZL6Qs1Qf++2jJrnKk85Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jwbhEecbGAZJ+GNj2okpm4vXsFt/tJ/Vvbta6t+ZSsg=;
 b=UYfA6Jk950fRJU01ek19pVZoPVH9737K1PT1xQ4BD45raUDdSpDUa0hsUzIII+/084MlmB9TCRapDhYqHzMScGi2ZZuz6N7Pu85Qe1IrKImFCMmAbw5SilZpbhOGNPNcNvXJwvoD0pP8aoLEkRc8mzc3S7l68t5Yy3akWv+5L5MaHCYvEhawYe1GDpl+0xUiKu6SSqdwJuwRnJwKxnzT3poOON4ZEeE0Z5sntIZapNtQWvOhgl4WqASIw7BVIJ0/Atsr2j45MQtB+MHVD9vNueECdxxHgXHr7+AjRbVEfWMaJ4Yr71f/WaBgUBxhpHNJ7YitnFE8BvSfDO1IbVUdSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jwbhEecbGAZJ+GNj2okpm4vXsFt/tJ/Vvbta6t+ZSsg=;
 b=N7RnSnYkF7H7GQ+jz667bcA+M0RzBv4P1gwrLN5sMTPdtZ3mj7dqv4VrlAx1l4AdqOa43rIzUsFVgEzSn3qolplzX7nJqN185V8sRykiaS+VtM6egDUJryd51rJKR7fLTjl8cyvUkte3HSa1Dtu9WvuRqKADTlKVebIZ3vRX8dQ=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB3016.namprd12.prod.outlook.com (2603:10b6:a03:dc::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.28; Tue, 7 Jul
 2020 18:25:36 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::3d4f:7ae8:8767:75a4]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::3d4f:7ae8:8767:75a4%7]) with mapi id 15.20.3153.029; Tue, 7 Jul 2020
 18:25:36 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Lukasz Majewski <lukma@denx.de>, Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH 1/3] y2038: linux: Provide __futimes64 implementation
Thread-Topic: [PATCH 1/3] y2038: linux: Provide __futimes64 implementation
Thread-Index: AQHWU+jzY9adT1jb60CTbjG6pNTOPKj7tpoAgAC5loA=
Date: Tue, 7 Jul 2020 18:25:36 +0000
Message-ID: <d93d6c50-92e7-65aa-9ee8-990c7a036ef3@synopsys.com>
References: <20200217131735.18180-1-lukma@denx.de>
 <20200217131735.18180-2-lukma@denx.de>
 <347a5a21-c308-4fae-5b80-34ee22fe8c78@synopsys.com>
 <20200707092120.071d5157@jawa>
In-Reply-To: <20200707092120.071d5157@jawa>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: denx.de; dkim=none (message not signed)
 header.d=none;denx.de; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [2601:641:c100:83a0:fee2:8ed0:e900:96d1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a477f577-ce15-4255-d3b2-08d822a324b8
x-ms-traffictypediagnostic: BYAPR12MB3016:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB3016AE4C57C918D1B74F3E34B6660@BYAPR12MB3016.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-forefront-prvs: 0457F11EAF
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /Wbdlksa8VIXBCZMPm1R7+tnhKBFcnDPLUpBUCKK/VWSr7Zfl5r4nTxZuS1DZuFetc19pnbGx9MM81uXmXVtKCl4HfHChdwoq05YLIcu5t4btGlETznlkv1qj2SUIBTXn6sgRNDESaWdLh55NI17ICl64sqUvpSNAltYCA/MeSBRHS+zqrR6u59qRzd9by0mBMUO/kVLE6m0zyE0fSfv2sSfrkyOpswl/dqbfd/J0WNTpXaRbT+8NJduIqGaQl67TPqoRCz+yAKKQY6esM3ETD8Bk1A597KXu1uGLNb2cTH4WetkQO13LIFp3oIkCqQ+RoyN+1ZPTe6SHQscmZnDGOHtMtIRijuUZBRqrAJxvcGO1XJw2nDsJ8zDERi+AiOEIXGmCqlaXT8hjgLkt6NwYHcRm+0naeiPRjkL/rnhOD9hSOQw5sCI9wF6lFkZSB+63lv1I2RTGhMuS2ZQB0Vnpg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(136003)(39860400002)(376002)(346002)(396003)(31696002)(76116006)(2616005)(186003)(66446008)(66476007)(36756003)(66556008)(8676002)(64756008)(478600001)(71200400001)(5660300002)(53546011)(8936002)(66946007)(966005)(6506007)(110136005)(2906002)(4326008)(54906003)(316002)(86362001)(6512007)(6486002)(31686004)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: J3AZWI0kdHbVjDQgRQXF7XHeZ/2tjyEtG9BPHTnRgjzH4TeYxYnmJlC4vY5s+g/4BhSp4Nn2/+1LaVt/Rx/388BesZMFSIXFgeC7SvENoRWC9kIkBW9xZOVFafPkH2/G+5WJTqr7uG1VdGD5D6u8twXXGiwjHiqUd8WtbiKY6JmD2hyR804ZZPBCrppSPV4bz8E1N0TJv8oyIA3R6ChZbSVmXJnH5GwtK9ObEWulVzOpxWVLgp63NY3DusAWRLxizZ4tPfVAI/dlhRZ0HNCquwD5DmT6F9ZFluyqBAcH2YGCTsv8mw9B7aEoBwCKvbcER2iCnUEwNlNCHxX265ES+b4ELwiMR3yW2e/r/U5qffEjYICcHFhekwk/7+BWjfmd+BFw/mjLt6U0srzf566hg5QDs+sobHL074FwtMgXUGXKZmn5/boRfOH5j50b6u4zILbTIKLC0SmvmxwoXGEi6l87s/I2sQpy7FDGVgE+uWjg2OeZ6DoLb+/uSeXGYEBrauHBhj8jIBUkgtstV2uSkbWA0ELgpYfGEnY95WgapZWi+JIC5LjtZLgk6dlxWXnD
Content-ID: <4FB7DA5BC62F264A89AF73A8B5F45A1F@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a477f577-ce15-4255-d3b2-08d822a324b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2020 18:25:36.3501 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dTyyiS6t41TkOlGBT4VpP8fIXAAK5P4NOeVm3eh+PsPsgTDmSSofS7L+CbdGbv5Izcwho3k3FyRpBbBgEF+bdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3016
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_142546_870024_6D2FACB5 
X-CRM114-Status: GOOD (  16.49  )
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
Cc: arcml <linux-snps-arc@lists.infradead.org>,
 GNU C Library <libc-alpha@sourceware.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 7/7/20 12:21 AM, Lukasz Majewski wrote:
>> ARC is 32-bit + TIMESIZE==64 but the new code is not getting built
>> (instead generic variant is). How do I override the generic fiel to
>> be built instead ?
> The futimes.c from sysdeps/unix/sysv/linux/ shall be built. 
> 
> The futimes.c is defined in following locations:
> y2038-glibc/misc
> y2038-glibc/sysdeps/unix/sysv/linux
> y2038-glibc/sysdeps/mach/hurd
> 
> The first one is a stub. The last one is for hurd.
> ARC shall use the middle one as well.

It seems I mixed up the various *utime* files.
Following are currently building for ARC

sysdeps/unix/sysv/linux/generic/futimesat.c
sysdeps/unix/sysv/linux/generic/utimes.c    #2

sysdeps/unix/sysv/linux/futimes.c
sysdeps/unix/sysv/linux/futimens.c
sysdeps/unix/sysv/linux/utimensat.c

The issue is generic/utimes.c

Is that the right file to build. If yes then it needs fixing as it expects
__NR_utimensat (and thus require the aliasing hack in ARC sysdep.h)

#define __NR_utimensat		__NR_utimensat_time6

P.S. I know glibc wiki has a bunch of pages (from Arnd?) for the y2038 support.
Are there other (newer) docs which explain the whole song and dance or is it the
usual RTFC.

> When I'm in doubt (or when for example code is auto generated to wrap a
> syscall) I do use
> https://github.com/lmajewski/meta-y2038/blob/master/README
> 
> with gdb to check which function is called. Maybe it would help you too?

Yeah. I typically use build logs to see which exact file is built and then objdump
to corroborate.


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

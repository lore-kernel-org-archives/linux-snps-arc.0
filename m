Return-Path: <SRS0=nPkL=A6=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6488FC433DF
	for <linux-snps-arc@archiver.kernel.org>; Sun, 19 Jul 2020 04:40:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09C6E20738
	for <linux-snps-arc@archiver.kernel.org>; Sun, 19 Jul 2020 04:40:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AxpzkeSi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="MU5bkyAT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Xbv6FbK9";
	dkim=neutral (0-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="GhTa6xdc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09C6E20738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/sXNJJASkRB2HtsGIyPzP1ZHLLqcGlp+SncwYCaqHh4=; b=AxpzkeSiBnGjQE8hjslLY5Gdi
	gne4tYA72mTDod4LMFm1IKTXoBaIMPkHeTAvvWUYtXmAV/dWO6OmFodAXcNzFZrbY/pqmTOkppQQc
	Lj8tCoOD4pN0F26Fcukmg70yib1e/38+GvLdo0jMnKWmMmX0hmjpgdW35EVM+nvCf4WoPmll2Z6Eb
	/fX7yppBIMPYX4JH496AbicEn//ObxzZsr/xYR2fb8GwjbQf5w+BAmDut/qclc4l/pA7sxe5I/eZ+
	BZlatTvrAL4lLdeqYTYyu9pIMyPtqYpADiLKX5HskVSyb/60gqyqhTctxhbSCXdEVAp3EkLqAyvcw
	i3EHPNSCQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jx17Y-0001Qn-LJ; Sun, 19 Jul 2020 04:40:20 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jx17V-0001Qc-Qd
 for linux-snps-arc@merlin.infradead.org; Sun, 19 Jul 2020 04:40:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Transfer-Encoding:
 Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:
 From:Sender:Reply-To:Content-Description;
 bh=BjFujtcxCzh5vnFTeGjjWxcGTzKHlVSHRzrf+o/FbW0=; b=MU5bkyATRJnKgaKYCLBMZpAOZE
 iBnaJdnm/DjUjIG+sLv1Jdni6W7v1qy4m46cns61Wo6AzlzFAEkTt9DjUjMvZTVZhL3OdVcZgatzp
 aDleQVP8HJ684T5DhL12SIChPsMzOWXijeNvEMh6ugjyhUBgo1lriddCVnYX4UJvQNbPWbG2ukB3s
 lar18SD8KgIpooR6G3PA85B+xxifXkxmzhX5XdZWNWgSS6D5Knyq1VC+VWaSRPFEfrLkY/I86wtts
 lDn0RIK/m/W/9iXnwKG+iafrPv7HmBVqo5BJabQcMj9ezVX/T425v9BspuWUazyBALhpN45hDyNrz
 tT9ErmGw==;
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jx17F-000160-8C
 for linux-snps-arc@lists.infradead.org; Sun, 19 Jul 2020 04:40:10 +0000
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com
 [10.192.0.81])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 01D24C00A6;
 Sun, 19 Jul 2020 04:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1595133585; bh=BjFujtcxCzh5vnFTeGjjWxcGTzKHlVSHRzrf+o/FbW0=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=Xbv6FbK9QqA382fHl/C7p+o+3y05rsd8Q4jzfk/Ln/VMBptuFNloUZeqJE4pa1taE
 a/M8+kIa9CpqxfLhSgG5mJxjYU3938oPlOG2uMYAoG7bbC91wfEfX1vqow3MI4aiIg
 hrU8VtBDUf1fJR10AAcexcgL9Db2aI1hn4bJ3/U1wIW4ffx0FTw8/rCxINNjlsq/fT
 Xl5hsXZEEarVXSWu9xpo8RMMi+9R0FCyycJ0fultKIxFHvIm8GeH63a+uUMegFlRdf
 as3jf/xRKFXRAFZRK39eauXYR743xnjvUmcsaXOsNcNVh5Z/enlAqcCsogVXZa4Bb4
 Cr6yKO7OmsRUw==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com
 [10.202.1.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id B3B19A0253;
 Sun, 19 Jul 2020 04:39:42 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2102.outbound.protection.outlook.com [104.47.70.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 61CF840046;
 Sun, 19 Jul 2020 04:39:40 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="GhTa6xdc";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P5DvUG4okW9nQXxSOvVsUgi9ae0Q4F1SpLIxK3oJWFrlRxL498mgDwXSv6jSeTiZTW4XKlNkfle48LSvq60NnICZ4nCoDHTW1N98jWUgpID4fgIvEhCU3cpS80EXzTdUN+IeHtm/kdwxtgqSFLESoyTrKcdk+9Yqng9dvyUCcXJChs6T9uNLEjkj6jefljCvAKTzMlJEbUEZP5WtVvfolNWpBBLM9jmXeK8L4STyruLUNheCiEZ2KFfbh41oHXlYY03zA/IMfSllThJOMzMpe/J6i5eprwmRe5frxKZmHzQMKMJRd4Eo3ug529cLodbKe7bcxs1Mfjz/qoPk4YTI+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BjFujtcxCzh5vnFTeGjjWxcGTzKHlVSHRzrf+o/FbW0=;
 b=gle9En8/CO3b2BBEIqk2RnSJGeJSA5oLTOJswIJC91KNTyL0MxQfo63lcOWfLBjGw0zmD37G5ZZCx3UDdZwUb3DQlvaYuS8yPfMwQeAZY1fSzwnWM3zVMRr3wpOwfop6QRAYvGZ7jGVUmWZJjm+61V9yoKyCHGPDJDeHFJKkwA8X7uAwZ6QjuS2fyn8dhGX+JYxlw0BTjU1WVhcstRWm5zy4LlPGAs9i6zStKG21q8vuZO82zTYz3M66jZrXPAb9RudcZqavjv3YslDxFhjryH2bhakukxPoQ1KVP7bH459o7TXn74Rh6EOY/XuAUsnGc59m2WqZWYw6vW6lccBqnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BjFujtcxCzh5vnFTeGjjWxcGTzKHlVSHRzrf+o/FbW0=;
 b=GhTa6xdcgtoq3+TO93jgdHXp3aEfhmtLiVn+NSqC66u4OcPTpghVF0ldphIdIqBo7Wg1DsEEA2v/cCWyuPy/mlpOTzx0/M4N0ZyXNuTBTCcPswwQEd947xQJasP5eLolQqMxjtlgdjqduyTEfs148DX+897b+cY2YCCiw87dqX8=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB2711.namprd12.prod.outlook.com (2603:10b6:a03:63::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.22; Sun, 19 Jul
 2020 04:39:37 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::3d4f:7ae8:8767:75a4]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::3d4f:7ae8:8767:75a4%7]) with mapi id 15.20.3195.023; Sun, 19 Jul 2020
 04:39:37 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Florian Weimer <fweimer@redhat.com>, "libc-alpha@sourceware.org"
 <libc-alpha@sourceware.org>
Subject: Re: [PATCH v2] elf: Change TLS static surplus default back to 1664
Thread-Topic: [PATCH v2] elf: Change TLS static surplus default back to 1664
Thread-Index: AQHWXYablS7Vn6EBa06r1fRiGBAyzQ==
Date: Sun, 19 Jul 2020 04:39:37 +0000
Message-ID: <95bfdf25-19b3-33b6-15a0-f4ba4326bf11@synopsys.com>
References: <87eepaqsgk.fsf@oldenburg2.str.redhat.com>
In-Reply-To: <87eepaqsgk.fsf@oldenburg2.str.redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [2601:641:c100:83a0:fee2:8ed0:e900:96d1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 34bbaaec-40c2-4b0c-269d-08d82b9dbe24
x-ms-traffictypediagnostic: BYAPR12MB2711:
x-microsoft-antispam-prvs: <BYAPR12MB2711210219332FAE35EE5AB8B67A0@BYAPR12MB2711.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Nb/PG6kbXlt5l2iW/SCPxYxgoMkbOnkzOvxk027uh5fpOSN7FQh8ZApFV07HT13D1yTIYDqwMOS0MhyBHrSyQ6W6Qqz1HyrXshnxCwEHC9eu7GIeyLHZqFM4wqI3wf/N+8VdKpNGUxlF62AgWTn06JNZfNvUT+7b/If0KYllrqJqJcaB8vWIezxPEQaTRG2CdiJIm4piWqohcQ5L01cyOOmVvb4J4rRYr4oTaMUmRe7PA9HdWHhQqEPysxRawrmQVD1fNHQvazLjEN53FZZ8Mj9zbFlXT1d6Di1o70P/y2HNAzKfkc5Lab3oxWNXaSmMTBYRyHZ2vmCkl7nbynPewZhYwiiTzQAya1+ZP94XY8zu+d7r8j326QVBMgKvBHiqeBktLLdXXIKzWbBEPVDWi3JZh+E0gVlVmAHBhRiexPboQ34eVrPtbNibl/hPXS6QVPgpn3ocXlDHYGKMg6LzvZrWOE3JJLWCK4n/vIW7Fuk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(376002)(346002)(39850400004)(366004)(136003)(396003)(6512007)(6486002)(186003)(36756003)(53546011)(4326008)(66946007)(83380400001)(6506007)(31696002)(66446008)(64756008)(66556008)(66476007)(86362001)(31686004)(2616005)(2906002)(316002)(76116006)(8936002)(110136005)(71200400001)(478600001)(8676002)(5660300002)(2004002)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: Lu3RvLsEjGDlguG8B7in0uRLw4wod6jQ62c3IZ6fWWn50v1jvi/Q4XC/ghzdm7DS3mbKAzlAtEmAxhKlHDGJuZ2cGygEmIj5OokGoUU696w5AHxBwMMYxBYm1liYPtxiuos/orxKV6w9MOCOEV+MPxivkbFI9SJXIxbqmxO8Tj9QOBDgwn9OD9j5eTZO7d1xDKD6f+0qoSQG1VPkhktrJMNMWc1ggKGEVRpY4k9DW4U7tcMrLGSDDpeYl/8vCNLUXBNmGLx4ggDITCE6e2wIpxEiyk7DcyDJ6XG4CfUZzjBOck87chQe7lsgWN3wF52NYQepJ6URLVKbl7wXRlDKNxMhlbyqD5fhlZCCv1YMHjsWLbRhO5mOnr1ZLSeIEwE+X8lArtbB+n4EoPW9vFJTIEVzECfExw7tM/XFU6mB8MSy53eRFX+6oDJlXxPEOZJ7qBWU9h1yNN65T32d0fmM6RbfNSiiNyBTU2qbRBuD4RfDBM37pkAwhUhkPyIXPn1VCBwhdWrqJ5OC85x8lQENhUdUPHFJrIp/8q6PqAQEJcAUHDcUd5j1BytIi0xPiXZP
x-ms-exchange-transport-forked: True
Content-ID: <76B585A8EC350540AF85F5D49D8DF7F4@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34bbaaec-40c2-4b0c-269d-08d82b9dbe24
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2020 04:39:37.1506 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kK11IpJomBm97n2RIWBJtX+e+ugeT5Xv4zsx57cxcvRV1I2d1wXag3Pfv/Zt0Z0uC4F2GCDXbhKSlG8U6lmXpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2711
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200719_054004_759672_EEF812ED 
X-CRM114-Status: GOOD (  34.08  )
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
Cc: arcml <linux-snps-arc@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Florian,

On 7/17/20 4:41 AM, Florian Weimer via Libc-alpha wrote:
> Make the computation in elf/dl-tls.c more transparent, and add
> an explicit test for the historic value.
> 
> ---
>  elf/Makefile          |  4 +++-
>  elf/dl-tls.c          | 37 ++++++++++++++++++++++++++++++-------
>  elf/tst-tls-surplus.c | 42 ++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 75 insertions(+), 8 deletions(-)

On ARC, tst-tls-surplus passes, but it seems there's still some static TLS
shenanigans.

FAIL: elf/tst-tls-ie
FAIL: elf/tst-tls-ie-dlmopen

$ cat elf/tst-tls-ie.out

maintls[1000]:	 0x20026f80 .. 0x20027368
var0[480]:	 0x2093c648 .. 0x2093c828 global-dynamic
var1[120]:	 0x2093cc40 .. 0x2093ccb8 global-dynamic
var2[24]:	 0x2093d0d0 .. 0x2093d0e8 global-dynamic
var3[16]:	 0x2093d500 .. 0x2093d510 global-dynamic
error: xdlfcn.c:29: error: dlopen:
glibc-2.31.9000-730-ge9422236a2dd4/build/elf/tst-tls-ie-mod4.so: cannot allocate
memory in static TLS block

cat elf/tst-tls-ie-dlmopen.out
maintls[1000]:	 0x20026f80 .. 0x20027368
var0[480]:	 0x2093c648 .. 0x2093c828 global-dynamic
var1[120]:	 0x2093d3d8 .. 0x2093d450 global-dynamic
var2[24]:	 0x2093e000 .. 0x2093e018 global-dynamic
var3[16]:	 0x2093ebc8 .. 0x2093ebd8 global-dynamic
error: xdlmopen.c:28: error: dlmopen:
glibc-2.31.9000-730-ge9422236a2dd4/build/elf/tst-tls-ie-mod6.so: cannot allocate
memory in static TLS block


> 
> diff --git a/elf/Makefile b/elf/Makefile
> index a2c3b12007..0b78721848 100644
> --- a/elf/Makefile
> +++ b/elf/Makefile
> @@ -216,7 +216,7 @@ tests-internal += loadtest unload unload2 circleload1 \
>  	 neededtest neededtest2 neededtest3 neededtest4 \
>  	 tst-tls3 tst-tls6 tst-tls7 tst-tls8 tst-dlmopen2 \
>  	 tst-ptrguard1 tst-stackguard1 tst-libc_dlvsym \
> -	 tst-create_format1
> +	 tst-create_format1 tst-tls-surplus
>  tests-container += tst-pldd tst-dlopen-tlsmodid-container \
>    tst-dlopen-self-container
>  test-srcs = tst-pathopt
> @@ -1794,3 +1794,5 @@ $(objpfx)tst-tls-ie-dlmopen.out: \
>    $(objpfx)tst-tls-ie-mod4.so \
>    $(objpfx)tst-tls-ie-mod5.so \
>    $(objpfx)tst-tls-ie-mod6.so
> +
> +$(objpfx)tst-tls-surplus: $(libdl)
> diff --git a/elf/dl-tls.c b/elf/dl-tls.c
> index 9a17427047..9fa62f5d22 100644
> --- a/elf/dl-tls.c
> +++ b/elf/dl-tls.c
> @@ -54,13 +54,37 @@
>     Audit modules use their own namespaces, they are not included in rtld.nns,
>     but come on top when computing the number of namespaces.  */
>  
> -/* Size of initial-exec TLS in libc.so.  */
> -#define LIBC_IE_TLS 160
> +/* Size of initial-exec TLS in libc.so.  This should be the maximum of
> +   observed PT_GNU_TLS sizes across all architectures.  Some
> +   architectures have lower values due to differences in type sizes
> +   and link editor capabilities.  */
> +#define LIBC_IE_TLS 144
> +
>  /* Size of initial-exec TLS in libraries other than libc.so.
>     This should be large enough to cover runtime libraries of the
>     compiler such as libgomp and libraries in libc other than libc.so.  */
>  #define OTHER_IE_TLS 144
>  
> +/* Default number of namespaces.  */
> +#define DEFAULT_NNS 4
> +
> +/* Default for dl_tls_static_optional.  */
> +#define OPTIONAL_TLS 512
> +
> +/* Compute the static TLS surplus based on the namespace count and the
> +   TLS space that can be used for optimizations.  */
> +static inline int
> +tls_static_surplus (int nns, int opt_tls)
> +{
> +  return (nns - 1) * LIBC_IE_TLS + nns * OTHER_IE_TLS + opt_tls;
> +}
> +
> +/* This value is chosen so that with default values for the tunables,
> +   the computation of dl_tls_static_surplus in
> +   _dl_tls_static_surplus_init yields the historic value 1664, for
> +   backwards compatibility.  */
> +#define LEGACY_TLS (1664 - tls_static_surplus (DEFAULT_NNS, OPTIONAL_TLS))
> +
>  /* Calculate the size of the static TLS surplus, when the given
>     number of audit modules are loaded.  Must be called after the
>     number of audit modules is known and before static TLS allocation.  */
> @@ -74,8 +98,8 @@ _dl_tls_static_surplus_init (size_t naudit)
>    opt_tls = TUNABLE_GET (optional_static_tls, size_t, NULL);
>  #else
>    /* Default values of the tunables.  */
> -  nns = 4;
> -  opt_tls = 512;
> +  nns = DEFAULT_NNS;
> +  opt_tls = OPTIONAL_TLS;
>  #endif
>    if (nns > DL_NNS)
>      nns = DL_NNS;
> @@ -85,9 +109,8 @@ _dl_tls_static_surplus_init (size_t naudit)
>    nns += naudit;
>  
>    GL(dl_tls_static_optional) = opt_tls;
> -  GLRO(dl_tls_static_surplus) = ((nns - 1) * LIBC_IE_TLS
> -				 + nns * OTHER_IE_TLS
> -				 + opt_tls);
> +  assert (LEGACY_TLS >= 0);
> +  GLRO(dl_tls_static_surplus) = tls_static_surplus (nns, opt_tls) + LEGACY_TLS;
>  }
>  
>  /* Out-of-memory handler.  */
> diff --git a/elf/tst-tls-surplus.c b/elf/tst-tls-surplus.c
> new file mode 100644
> index 0000000000..b0dea0b5ee
> --- /dev/null
> +++ b/elf/tst-tls-surplus.c
> @@ -0,0 +1,42 @@
> +/* Test size of the static TLS surplus reservation for backwards compatibility.
> +   Copyright (C) 2020 Free Software Foundation, Inc.
> +   This file is part of the GNU C Library.
> +
> +   The GNU C Library is free software; you can redistribute it and/or
> +   modify it under the terms of the GNU Lesser General Public
> +   License as published by the Free Software Foundation; either
> +   version 2.1 of the License, or (at your option) any later version.
> +
> +   The GNU C Library is distributed in the hope that it will be useful,
> +   but WITHOUT ANY WARRANTY; without even the implied warranty of
> +   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> +   Lesser General Public License for more details.
> +
> +   You should have received a copy of the GNU Lesser General Public
> +   License along with the GNU C Library; if not, see
> +   <https://www.gnu.org/licenses/>.  */
> +
> +#include <stdio.h>
> +#include <support/check.h>
> +#include <support/xdlfcn.h>
> +
> +static int do_test (void);
> +#include <support/test-driver.c>
> +
> +/* This hack results in a definition of struct rtld_global_ro.  Do
> +   this after all the other header inclusions, to minimize the
> +   impact.  */
> +#define SHARED
> +#include <ldsodefs.h>
> +
> +static
> +int do_test (void)
> +{
> +  /* Avoid introducing a copy relocation due to the hidden alias in
> +     ld.so.  */
> +  struct rtld_global_ro *glro = xdlsym (NULL, "_rtld_global_ro");
> +  printf ("info: _dl_tls_static_surplus: %zu\n", glro->_dl_tls_static_surplus);
> +  /* Hisoric value: 16 * 100 + 64.  */
> +  TEST_VERIFY (glro->_dl_tls_static_surplus >= 1664);
> +  return 0;
> +}
> 
> 

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

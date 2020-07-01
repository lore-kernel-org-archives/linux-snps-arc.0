Return-Path: <SRS0=/nRw=AM=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20B02C433DF
	for <linux-snps-arc@archiver.kernel.org>; Wed,  1 Jul 2020 19:14:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 935E820720
	for <linux-snps-arc@archiver.kernel.org>; Wed,  1 Jul 2020 19:14:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sJy6LWy4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="GDso44eB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="W0aMrZOY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 935E820720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gUl0QlbbFaD7GWjkYRBn9gEsRbnVopcHUmT0oc/BSpc=; b=sJy6LWy4tRV8j3t+gWMhPbu7y
	90feGljtxMOB2/B0Qod9lMjv9+aMBTO5Uet2dei0w8uT79AP7f/EoUpV05V/Y7qTrmKcFASashmUb
	UGwHkRb80Rrm36eS8uxdeqb0AZ01FrcAe4RS+WTE0vncD3sgkE+U9JqaOOyaJWvlIhTQgy8jXqy1z
	DsWv890DmwtN3RCdZ7l4WN6SO4aL6SIcmnFcx8kwcBkDol1GpfaXUDoT3TovW+75+ZrKInIXPPk3e
	DZOL0JTl56ArJ5SmuQ/uofoPXprVzsj8/7F5jeW177c1YRuFFbPTDPp/0H+WeIW/AYNmSAz3u/AKP
	fs08gsOkA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqiBO-0004Vv-2b; Wed, 01 Jul 2020 19:14:10 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqiBK-0004VD-ST
 for linux-snps-arc@lists.infradead.org; Wed, 01 Jul 2020 19:14:08 +0000
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com
 [10.205.2.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id B41DFC00D6;
 Wed,  1 Jul 2020 19:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1593630845; bh=Xx0Xh7SaM19IhT7efg32ckBnM8XlSJsTvU2yOfYc/GU=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=GDso44eBQf79Us/AFc7GoXVoNS1J0C68idFI+v6M3hy7E7VewFVAbydHEdx/yLH9k
 eK2YlkZQgGYmz0LCT4EziKPGpB72hz/yVWhCYwybEBQ3V4H0hAZFv6rut8S3lBeoH/
 2MshSazVK0I6CPGZ3kDfBen2XrY5czC9oxDcXO1F2InK5QwRihENMoUBlZBit04dZn
 CHyB01qHHG8sOLzXxGarrK0IcoKRGYvFIXGeI5sXv3g3VWawg8MlX0JBFi11sP9PQ6
 +T/n+6VZi1MFVewoUU9thzdJ45UT6woSINtWrFdXfBOVgCTjIkUGQD6isOOJ4VNxIN
 dfaKq6j5x80Ug==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com
 [10.202.1.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 2B36BA0057;
 Wed,  1 Jul 2020 19:14:00 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2107.outbound.protection.outlook.com [104.47.70.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id C22814017D;
 Wed,  1 Jul 2020 19:13:58 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="W0aMrZOY";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bXmsnirTXyxqTyZiVoUhPCbny72BeZj9nmDO5dvE4uSFDXtSwD2XVGYSnHBoGwdiWpOtd6yKELEDw8U0pRLavT/YHpwczzxUE+sBggfdgqXUTuJiKmrbOlSQ4ZdnbIHzDNGGBnjDYu5YSxVSxK98ajD9Sgt5j/dhjhDCjlOC054wVscNhsKRxk+m716XZLQjDbzoiaGLgA3OXz9xXuYiv2rAeQm3bpTbAOogM0FRwWLjPc03MA+2Min7dWAu83pEdW8qEjjGUW7zY5sJxD3o0nBQEYrORBhKWqNd5ytKqr3WHpppFK776bQcf6BHzke9/GxVU5WH/hp/DtRX8r6/CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xx0Xh7SaM19IhT7efg32ckBnM8XlSJsTvU2yOfYc/GU=;
 b=HceARSWa2Ef+LzF/fpAyxBPLgigh9WlyMyJRytw8FBJdlRCkAcNMkUriX/wg/+vNM4EOUGNjhmdial05secthiF99gGxdtnP/ka5n5htHXmAgudX4FWnKU6aiOPf5wrv+m8+9GQmSWHfu2IteNkBeLnUG4NrItCfoe/CLsO7rxfv6OgpJjYiwHddDMud+sd8a8V9vI6Xbhn9iVU94ub2aL2Emx8fukes35TtaaGBV2eO4JUggstMcjrrymtxKRV+CgJCfNDkmw4UB1eEbQsa6e/EFVkqO89ykcW4KNLyeq/jJJuZQfKXStTHFvmNahU93VZnVYM0h9oC3U1V8B+lUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xx0Xh7SaM19IhT7efg32ckBnM8XlSJsTvU2yOfYc/GU=;
 b=W0aMrZOYQNQ2v3oPnD5sXN2Jf7mFoFzXrw9cAaTd9E+FB0Chvm9WMsa73S6zhxGXs3KCA40wDYcTNjzm4KxlZGP9cKnF/O0bmbxUgGWHruSgF8ESmh05BJRxt2qy85FAzx4vr4TmECGCktKa93bV2+20XhesPaQASp5npoIM+UM=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BY5PR12MB4050.namprd12.prod.outlook.com (2603:10b6:a03:207::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.22; Wed, 1 Jul
 2020 19:13:56 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::3d4f:7ae8:8767:75a4]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::3d4f:7ae8:8767:75a4%7]) with mapi id 15.20.3153.020; Wed, 1 Jul 2020
 19:13:56 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Adhemerval Zanella <adhemerval.zanella@linaro.org>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Subject: Re: [PATCH v7 00/13] glibc port to ARC processors
Thread-Topic: [PATCH v7 00/13] glibc port to ARC processors
Thread-Index: AQHWTzwytpRooBUOGkq98kzaMNWkF6jx8/OAgAElG4A=
Date: Wed, 1 Jul 2020 19:13:56 +0000
Message-ID: <e88bc836-ff16-d32b-cc06-fa473c4c6744@synopsys.com>
References: <20200615201441.31820-1-vgupta@synopsys.com>
 <c5edd9af-9dc6-d572-4779-6897e43c0a31@synopsys.com>
 <a3afd7ef-87d9-f033-fea3-f4854b9188ef@synopsys.com>
 <9c1ae166-4e37-e8ab-d6c6-cdbda5b15d83@linaro.org>
In-Reply-To: <9c1ae166-4e37-e8ab-d6c6-cdbda5b15d83@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [2601:641:c100:83a0:fee2:8ed0:e900:96d1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7f0dc45e-1a8e-41d8-2e32-08d81df2e6d5
x-ms-traffictypediagnostic: BY5PR12MB4050:
x-microsoft-antispam-prvs: <BY5PR12MB4050BEECCBBC3FDD0DCCD3E2B66C0@BY5PR12MB4050.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 04519BA941
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ka1w2k/ylY/5zk+MyagKcY673Ob6FKn2B6D4IS+zFgiQbAZuex+rQ6PwkYmyFx6pkhSL1NqW/Wxc+R3gcqDgfKzB5cTnIXy2wGIG/4kIITwtQDMPHpQyUBpjM5eWnahKhCCrJtXlwkw1HKupWpeLsGk63wJDCgzBFxgFv8P9kTMueILWypDJWL202Hu5cQ5ykIirUHSN/ybeHIWI6JQ0O0JEytQpFKqBwfiSIHCzlvpxi2ZH71GC9rVZluCYrPDAyYmS3yLcWWhZJl1U+0vahV8BFxIm4PuzJ570zYvESi4RyGc7difkKGcem2R8ZN7gE8DuWNIuZlOn+N+IKiwl31BbkYzr0J5ao7B7G4LbOil4ZnCfLCpTeBGyCLHRIT/T
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(39860400002)(376002)(136003)(346002)(396003)(6512007)(36756003)(478600001)(4326008)(8936002)(8676002)(2906002)(2616005)(31696002)(110136005)(316002)(86362001)(83380400001)(5660300002)(64756008)(66556008)(6486002)(66446008)(53546011)(6506007)(76116006)(66476007)(31686004)(71200400001)(66946007)(186003)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: +76+dowCTuySzIFu9cOJb8dw7mNtr9gtbT6Pf8+Z5SRQI6HUUfS1ujDN4ucBnGCmVg3PMYcANCKDudQwMyCvS59d9KOU22jIxkGpqBc7mpBCJjb8jnM+g1V1y7AFRNjWRy8nv6LQTGEDHc/oFtD0evLg6thv7sUyLMBjD6T6ewnBN4iyHfzbtXGuXztad8ldgQa32u0oeP7oVtzkkrv1pqG8TWBIOHKvhiLpkUrkSRkO4qPCy/2NEOvY3RERuhAhn2iafnTKfyLMN9Z4ZHM0HREpVK24+FtNxy6ZdCdhgtpm4s0VA0q7YoHQZjNRT4N6guOWq1F4xh0K1GPlrqnYw7O0oQH0FOOo8q0JAo38Cgxs/0o4/6O6lJZnA2GGKt4gd6sR2bISkJEg+/0JEVzKdDWZbH/iflCRyTYCatlioh+Riy56aUVBEakY5MvfIOJZXoCuK0+0DRWSWzevocWx1Wlq2k0bVdP2aWd3v4h1085tHl/YqwXoBGYrAWKRNU4WS3T1PC7CwovcRj+lZLhyAfrZ297vjOGQmEFXNo+CF3CZyNssFo1+ct2BzsD4C2Us
x-ms-exchange-transport-forked: True
Content-ID: <5251D9DB796CED458C611587E6FAE5C2@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f0dc45e-1a8e-41d8-2e32-08d81df2e6d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2020 19:13:56.2938 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9hQAef+gPhbf4EgRvDrq0oW12hvJio2gZtybzqCgNdar6WympIA4KMxqxW9lEMMej2xbcx+KjD3EsLyQq7FjuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200701_151407_362911_E3D37734 
X-CRM114-Status: GOOD (  17.41  )
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
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 6/30/20 6:44 PM, Adhemerval Zanella via Libc-alpha wrote:

>> I've posted the incremental series (v7.1) as a followup to include rebase fixes
>> since v7. The changes are minimal and documented in respective patches. Kindly
>> review so we can get this in, in this cycle.
> 
> Thanks for your patience, I will help wrap this up so we can include in
> on 2.32.

And thx to you for your help and time.

>>>> (b) Full testsuite ran in a cross compile setup using buildroot on HSDK development
>>>>     platform. Bulk of failures come from cross testing setup and I
>>>>     intend to improve things with native testing going forward.
>>>>
>>>> | Summary of test results:
>>>> |     30 FAIL   (-3)
>>>> |
>>>> | FAIL: csu/test-as-const-tcb-offsets
>>>> + FAIL: elf/tst-audit14
>>>> + FAIL: elf/tst-audit15
>>>> + FAIL: elf/tst-audit16
> 
> Any idea what it might the culprit here?

These are newly introduced so I didn't probe deeply. strace showed wait() time out

statx(1, "", AT_STATX_SYNC_AS_STAT|AT_EMPTY_PATH, STATX_BASIC_STATS,
{stx_mask=STATX_BASIC_STATS, stx_attrib0
kill(-1805, SIGKILL)                    = 0
kill(1805, SIGKILL)                     = 0
wait4(1805, [{WIFSIGNALED(s) && WTERMSIG(s) == SIGKILL}], WNOHANG|WSTOPPED, NULL)
= 1805
--- SIGCHLD {si_signo=SIGCHLD, si_code=CLD_KILLED, si_pid=1805, si_uid=0,
si_status=SIGKILL, si_utime=0, si_-
write(1, "Timed out: killed the child proc"..., 35Timed out: killed the child
process) = 35
write(1, "\n", 1
)                       = 1

> 
>>>> | FAIL: elf/tst-ldconfig-ld_so_conf-update # not true: dlopen
>>>> | FAIL: iconv/test-iconvconfig		# Needs gconv installed
>>>> | FAIL: io/ftwtest			# Requires execution by non-root
>>>> | FAIL: io/tst-lockf
>>>> | FAIL: libio/tst-wfile-sync
> 
> Could it be related to NFS usage as well?

Very likely so.

>>>> | FAIL: locale/tst-C-locale
>>>> | FAIL: locale/tst-duplocale
>>>> | FAIL: locale/tst-locale-locpath
>>>> | FAIL: locale/tst-locname
>>>> | FAIL: localedata/sort-test
> 
> Any idea why locale is not being working here (these tests are really
> simple, maybe another issue related to the filesystem)?

Actually these are all OK. cross setup sometimes has issues (e.g. nfs automount at
boot not working) these tests hit first and fail. When testing is resumed the
failures stick. I have a clean list of current failure with v7.1 at the end of
this msg.

> 
>>>> | FAIL: nptl/test-cond-printers		# needs Python3 and target GDB on target
>>>> | FAIL: nptl/test-condattr-printers	#    ditto
>>>> | FAIL: nptl/test-mutex-printers	#    ditto
>>>> | FAIL: nptl/test-mutexattr-printers	#    ditto
>>>> | FAIL: nptl/test-rwlock-printers	#    ditto
>>>> | FAIL: nptl/test-rwlockattr-printers	#    ditto
>>>> | FAIL: nptl/tst-umask1			# passes if run natively on target (NFS ACLv3 support needed)
>>>> | FAIL: nss/bug-erange
>>>> | FAIL: nss/tst-nss-files-hosts-getent	# Timed out
>>>> | FAIL: nss/tst-nss-files-hosts-multi	# Timed out
>>>> | FAIL: posix/bug-ga2			# DNS issue: google DNS vs. SNPS
>>>> | FAIL: posix/globtest			# require same user on target and host
>>>> | FAIL: posix/tst-getaddrinfo5		# passes outside corporate network
>>>> | FAIL: stdio-common/bug22		# Needs more RAM: 2 GB memory
> 
> We might try to enhance this test to avoid require too much memory.

Indeed.

current list of failures:
Currently debugging the math errors, they are regression from recent rework for
reviews.

FAIL: elf/tst-audit14
FAIL: elf/tst-audit15
FAIL: elf/tst-audit16
FAIL: elf/tst-ldconfig-ld_so_conf-update
FAIL: iconv/test-iconvconfig
FAIL: io/ftwtest
FAIL: io/tst-lockf
FAIL: libio/tst-wfile-sync
FAIL: locale/tst-localedef-path-norm
FAIL: math/test-double-acos
FAIL: math/test-double-asin
FAIL: math/test-float-exp10
FAIL: math/test-float32-exp10
FAIL: math/test-float32x-acos
FAIL: math/test-float32x-asin
FAIL: math/test-float64-acos
FAIL: math/test-float64-asin
FAIL: math/test-ldouble-acos
FAIL: math/test-ldouble-asin
FAIL: nptl/test-cond-printers
FAIL: nptl/test-condattr-printers
FAIL: nptl/test-mutex-printers
FAIL: nptl/test-mutexattr-printers
FAIL: nptl/test-rwlock-printers
FAIL: nptl/test-rwlockattr-printers
FAIL: nptl/tst-umask1
FAIL: nss/bug-erange
FAIL: nss/tst-nss-files-hosts-getent
FAIL: nss/tst-nss-files-hosts-multi
FAIL: posix/bug-ga2
FAIL: posix/globtest
FAIL: posix/tst-getaddrinfo5
FAIL: stdio-common/bug22
FAIL: sunrpc/bug20790
FAIL: timezone/tst-tzset
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

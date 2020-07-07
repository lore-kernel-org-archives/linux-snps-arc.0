Return-Path: <SRS0=Wyqd=AS=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F37BC433E0
	for <linux-snps-arc@archiver.kernel.org>; Tue,  7 Jul 2020 12:59:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7A2620708
	for <linux-snps-arc@archiver.kernel.org>; Tue,  7 Jul 2020 12:59:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IXWouX+5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="OVA3HoaQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="fBSFhJRo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7A2620708
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bDX8WD257VBEXT0z0AYOcphzrP0SpolkEF9jMsFqokk=; b=IXWouX+50SM6FvUO081LMjYMO
	rQmSe4lY1ybjL3Poa1mphDhhAkkaoaWBRIEEq8zfD81oQbse0Ryy2AAbMekMIsOy118ZFpTNzKU1u
	UmQOx516dnaWsM90mJI0nXNwReoNw0syI13+YVhHDtPkoY0RZSJJWoiPgScKRNTiMCCi6J68VYzDV
	Dn1H4BUfr86xGPofRsQ9jIlotjGYCwaXAoEYik/q545rgQDz6tnNEGYmG9lvg5mCrN1HEPC8yU1bj
	gtjiNlwPkDxJQWal0PfWVwz8zuf4Ra7V/yuaAtD2wokhF0J58ON6jq6/uqFUSCIjGPVq2+F7L3TU3
	nPEg8fW1w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jsnC3-00072z-Gf; Tue, 07 Jul 2020 12:59:27 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsnBw-0006yA-SU
 for linux-snps-arc@lists.infradead.org; Tue, 07 Jul 2020 12:59:23 +0000
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id CD916C06EA;
 Tue,  7 Jul 2020 12:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1594126758; bh=Do9X420cnR10sioWAuNfM9Tqfdi6iovVfPYAb8C9ca4=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=OVA3HoaQpuG80DJZ3NGWo9Z03z2eW1RJzBkIYuD21HUAFA8xQaAvKb/PTeB7UefzL
 QBdFSsVkr3GZYnD/mjI7U3CsR9aW6m/YvXRuutmF+j2yxKU0/1NonSOFrkHUv8Xbbs
 VDvfGdDXHPzh3NKfAK9y1Fdo1W2eFfy6QSwkruopoQnSyGv1CspbngdVo1wTcNVpRn
 mYpIacYf1R2vT20PlxLnXrrjIyL8W7n4dkAaDiRnSE6m0xDEen3UVLF0d83+Jc26ks
 VekJdukzdERh079Ho6taJg31fyq11huwDn+uc6e9FkdtcbA4It3XZjrgVtBfx8xSty
 unPg+gCJxtUaQ==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com
 [10.202.1.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 6B7C1A0077;
 Tue,  7 Jul 2020 12:59:15 +0000 (UTC)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02lp2052.outbound.protection.outlook.com [104.47.36.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id C795F4013F;
 Tue,  7 Jul 2020 12:59:13 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=didin@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="fBSFhJRo";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l3twEwYVvVRDjVewx8D9ut60iF3dp8HMHD0HfMpwI8g+fGTxENjY3a8btXmKdFCGarOiL5HBfQRZOU+VK+CEPVFguHzilaSJK14orxww9XILl7f5dwm1TP3VQ7VjWuZHzY0MDkhbCshHavB4uudMzfstqGTNvXTCoDY1DT3LBFagrntaBk1BXGMG+HTGykQ+bNuvJmzmZ5qlpddsD286uPY01i7tC9Cv2onP3HY4yh8nvty4Ms4DDOhl39+8tXitMHcwepLVRxaGa1IGYsnKSbvN0kN4BAh/U/n+G8fcJCFotsRdTAf2KJJsfjBgm9wqkxaxwDrort/xxDi4pO1lpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Do9X420cnR10sioWAuNfM9Tqfdi6iovVfPYAb8C9ca4=;
 b=W+jM5YHto8YwG92MxKcwrPg3qYctbNwSgxMGBgGArz9GR4fs11kJC0PargVnp/12eo/cREZCj4gCNeuIopnxYBovrxm3IxXbCLZRX1eI8L/MXD5LOhgRxjJ3jIcIugOScotuXVGeEKjJnjWeWCVHeKfCd4GPYfmIZak9cdacbyCei4xoFG3uXPTeYLCXZ8CtmT1r9nPbw2LsdhK8U3aqCjPIz2MWA8W/T36k4RHJx/VSyFq4r8SOj32vb7Nbpka7yEnk+4YbVv6JPGAFbPL19GhmuYRf+IpPUIrj6itQQYqb7de9xCAhnIR/a7SWF8+3rrjR/hEAvuhUSePU+eKENA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Do9X420cnR10sioWAuNfM9Tqfdi6iovVfPYAb8C9ca4=;
 b=fBSFhJRoZmGOVSP98mWHfTRUGOVVv59oNp2Ij5p41RgwZKhOHjYVqM5bppGWxaytGoXOqNcmZuARIlt05N671LugrTgJkF8jZuSjgH0rDT7cHRBXDBpR5tFgtLC17+WBdAewebFRJ3HechTqCQENOaXxYjSgJuUJi/0CcdBxgDU=
Received: from CH2PR12MB4104.namprd12.prod.outlook.com (2603:10b6:610:a4::12)
 by CH2PR12MB4214.namprd12.prod.outlook.com (2603:10b6:610:aa::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.23; Tue, 7 Jul
 2020 12:59:11 +0000
Received: from CH2PR12MB4104.namprd12.prod.outlook.com
 ([fe80::6cfc:8fa:41af:2f21]) by CH2PR12MB4104.namprd12.prod.outlook.com
 ([fe80::6cfc:8fa:41af:2f21%9]) with mapi id 15.20.3174.020; Tue, 7 Jul 2020
 12:59:11 +0000
X-SNPS-Relay: synopsys.com
From: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
To: Oleksij Rempel <linux@rempel-privat.de>
Subject: RE: Linux kernel commit "add phy-mode support for the KSZ9031 PHY"
 broke ETH for Synopsys HSDK board.
Thread-Topic: Linux kernel commit "add phy-mode support for the KSZ9031 PHY"
 broke ETH for Synopsys HSDK board.
Thread-Index: AdZQw58XMiLOAIpuSJOPBGaJzFKoGAANbKAAANi7dhA=
Date: Tue, 7 Jul 2020 12:59:11 +0000
Message-ID: <CH2PR12MB41043173D45D80E9E6867CDED9660@CH2PR12MB4104.namprd12.prod.outlook.com>
References: <DM6PR12MB41060B53C1B81BD0A2D49ED0D96D0@DM6PR12MB4106.namprd12.prod.outlook.com>
 <1feb8e17-c92d-c7b4-dbe4-7ff0a23dface@rempel-privat.de>
In-Reply-To: <1feb8e17-c92d-c7b4-dbe4-7ff0a23dface@rempel-privat.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?utf-8?B?UEcxbGRHRStQR0YwSUc1dFBTSmliMlI1TG5SNGRDSWdjRDBpWXpwY2RYTmxj?=
 =?utf-8?B?bk5jWkdsa2FXNWNZWEJ3WkdGMFlWeHliMkZ0YVc1blhEQTVaRGcwT1dJMkxU?=
 =?utf-8?B?TXlaRE10TkdFME1DMDROV1ZsTFRaaU9EUmlZVEk1WlRNMVlseHRjMmR6WEcx?=
 =?utf-8?B?elp5MWhOVEV3WW1ObFpTMWpNRFV4TFRFeFpXRXRZbVUyWmkwMVkyVXdZelV5?=
 =?utf-8?B?TjJRM09ESmNZVzFsTFhSbGMzUmNZVFV4TUdKalpqQXRZekExTVMweE1XVmhM?=
 =?utf-8?B?V0psTm1ZdE5XTmxNR00xTWpka056Z3lZbTlrZVM1MGVIUWlJSE42UFNJek16?=
 =?utf-8?B?TTVJaUIwUFNJeE16SXpPRFl3TURNME9USTNOVFkyT0RjaUlHZzlJbTlTTW5S?=
 =?utf-8?B?NlQyOXFhbUpKWTI5T1RWSmtlbGt4YkRkMWQyeHdORDBpSUdsa1BTSWlJR0pz?=
 =?utf-8?B?UFNJd0lpQmliejBpTVNJZ1kyazlJbU5CUVVGQlJWSklWVEZTVTFKVlJrNURa?=
 =?utf-8?B?MVZCUVVKUlNrRkJSRkJZUjNSdVdHeFVWMEZaUzFScGFIUnVUR1ZhU21kd1Qw?=
 =?utf-8?B?dEhNbU4wTld0clQwRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?SVFVRkJRVU5yUTBGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZG?=
 =?utf-8?B?UVVGUlFVSkJRVUZCTWtsRlMweFJRVUZCUVVGQlFVRkJRVUZCUVVGQlNqUkJR?=
 =?utf-8?B?VUZDYlVGSGEwRmlaMEpvUVVjMFFWbDNRbXhCUmpoQlkwRkNjMEZIUlVGaVow?=
 =?utf-8?B?SjFRVWRyUVdKblFtNUJSamhCWkhkQ2FFRklVVUZhVVVKNVFVY3dRVmxSUW5s?=
 =?utf-8?B?QlIzTkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVVZCUVVGQlFVRkJRVUZCWjBG?=
 =?utf-8?B?QlFVRkJRVzVuUVVGQlIxbEJZbmRDTVVGSE5FRmFRVUo1UVVoclFWaDNRbmRC?=
 =?utf-8?B?UjBWQlkyZENNRUZITkVGYVVVSjVRVWhOUVZoM1FtNUJSMWxCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGUlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlEwRkJRVUZCUVVObFFVRkJRVnBuUW5aQlNGVkJZbWRDYTBGSVNV?=
 =?utf-8?B?RmxVVUptUVVoQlFWbFJRbmxCU0ZGQlltZENiRUZJU1VGamQwSm1RVWhOUVZs?=
 =?utf-8?B?UlFuUkJTRTFCWkZGQ2RVRkhZMEZZZDBKcVFVYzRRV0puUW0xQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkNRVUZCUVVGQlFVRkJRVWxCUVVGQlFVRktORUZCUVVKdFFVYzRRV1JS?=
 =?utf-8?B?UW5WQlIxRkJZMmRDTlVGR09FRmpRVUpvUVVoSlFXUkJRblZCUjFWQlkyZENl?=
 =?utf-8?B?a0ZHT0VGamQwSm9RVWN3UVdOM1FqRkJSelJCV25kQ1prRklTVUZhVVVKNlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUlVGQlFVRkJRVUZCUVVGblFVRkJRVUZCYm1kQlFV?=
 =?utf-8?B?RkhXVUZpZDBJeFFVYzBRVnBCUW5sQlNHdEJXSGRDZDBGSFJVRmpaMEl3UVVj?=
 =?utf-8?B?MFFWcFJRbmxCU0UxQldIZENla0ZITUVGaFVVSnFRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFWRkJRVUZCUVVGQlFVRkRRVUZC?=
 =?utf-8?B?UVVGQlEyVkJRVUZCV21kQ2RrRklWVUZpWjBKclFVaEpRV1ZSUW1aQlNFRkJX?=
 =?utf-8?B?VkZDZVVGSVVVRmlaMEpzUVVoSlFXTjNRbVpCU0UxQlpFRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUpCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCU1VGQlFVRkJRVW8wUVVGQlFtMUJSemhCWkZGQ2RVRkhVVUZqWjBJ?=
 =?utf-8?B?MVFVWTRRV05CUW1oQlNFbEJaRUZDZFVGSFZVRmpaMEo2UVVZNFFXUkJRbnBC?=
 =?utf-8?B?UnpCQldYZEJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGRlFVRkJRVUZCUVVGQlFXZEJRVUZCUVVGdVowRkJRVWRaUVdKM1FqRkJS?=
 =?utf-8?B?elJCV2tGQ2VVRklhMEZZZDBKM1FVZEZRV05uUWpCQlJ6UkJXbEZDZVVGSVRV?=
 =?utf-8?B?RllkMEl4UVVjd1FWbDNRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJVVUZCUVVGQlFVRkJRVU5CUVVGQlFVRkRaVUZCUVVG?=
 =?utf-8?B?YWQwSXdRVWhOUVZoM1FuZEJTRWxCWW5kQ2EwRklWVUZaZDBJd1FVWTRRV1JC?=
 =?utf-8?B?UW5sQlIwVkJZVkZDZFVGSGEwRmlaMEp1UVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUWtGQlFVRkJRVUZCUVVGSlFVRkJR?=
 =?utf-8?B?VUZCU2pSQlFVRkNla0ZIUlVGaVFVSnNRVWhOUVZoM1FtaEJSMDFCV1hkQ2Rr?=
 =?utf-8?B?RklWVUZpWjBJd1FVWTRRV05CUW5OQlIwVkJZbWRCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVVkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJaMEZCUVVGQlFXNW5RVUZCU0UxQldWRkNjMEZIVlVGamQwSm1RVWhG?=
 =?utf-8?B?UVdSUlFuWkJTRkZCV2xGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZSUVVGQlFVRkJRVUZCUTBGQlFVRkJRVU5sUVVGQlFXTjNRblZCU0VGQlkz?=
 =?utf-8?B?ZENaa0ZIZDBGaFVVSnFRVWRWUVdKblFucEJSMVZCV0hkQ01FRkhWVUZqWjBK?=
 =?utf-8?B?MFFVWTRRVTFSUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQ1FVRkJRVUZCUVVGQlFVbEJRVUZCUVVGS05FRkJRVUo2?=
 =?utf-8?B?UVVjMFFXTkJRbnBCUmpoQllrRkNjRUZIVFVGYVVVSjFRVWhOUVZwUlFtWkJT?=
 =?utf-8?B?RkZCV2xGQ2VVRkhNRUZZZDBKNlFVaFJRV1JSUW10QlIxVkJZbWRDTUVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJSVUZCUVVGQlFVRkJRVUZuUVVGQlFV?=
 =?utf-8?B?RkJibWRCUVVGSVdVRmFkMEptUVVkelFWcFJRalZCU0dOQlluZENlVUZIVVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVZGQlFVRkJRVUZC?=
 =?utf-8?Q?QUFDQUFBQUFBQT0iLz48L21ldGE+?=
x-dg-rorf: true
authentication-results: rempel-privat.de; dkim=none (message not signed)
 header.d=none;rempel-privat.de; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [188.243.162.47]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2134f2fd-df9a-4f6f-8b4c-08d822758b6d
x-ms-traffictypediagnostic: CH2PR12MB4214:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR12MB4214A99992516B38ED9652E9D9660@CH2PR12MB4214.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-forefront-prvs: 0457F11EAF
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: h7k6o2EdpabTx6g5uYEOVzJ0rZPsjeqnEcwgSBfW/UEL09PTxuKu/r4k1Qn/E10+oDmyEgz7dLJuFX/b4GSqNnk915r+0mjlBtjLSQPNOsDPAEREQAX9sSn+4d2bxWjyKu3+ZS6jibpV8adqfR7r6Iy4Yv+R95fAOHUacY8Tmen+G+5fW+8TYnhKGYwBu9EqFMgW0l50DVpAlZBDAcV5E2V7DBsIZK2U/UYnT0Q1CUlF/Wr0cXKxvLuveseIN9z7ZCfCQrYrFkAPcLY0kUbCiNpXgQorGtbprD5a8QU2qAqimenK71zJyfp4LhM+9AOUtGuwl1ec7hUxSx5FUBBNlscPLyLjHWkEaFklun7g5hi6V+vPL8TFwj8oVEjYQWq0GeMl/mXiJcYd6GJlmnw7ow==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB4104.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(376002)(346002)(39860400002)(136003)(366004)(396003)(76116006)(52536014)(8936002)(478600001)(54906003)(86362001)(8676002)(71200400001)(316002)(55016002)(9686003)(6916009)(966005)(64756008)(66556008)(66946007)(4326008)(6506007)(66446008)(53546011)(66476007)(2906002)(186003)(33656002)(26005)(107886003)(83380400001)(7696005)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: cYobZqZAvvQyznxYKZEHXUdARN9qurt2S0yjKKKJksM+DcvxeezwZifqZilBiPLq1YAR/ebYeulvBp5Hq5+96Y6NdRnF/pqTyKBVXkgU3YoBsU7DF20xBJrrX84vWXsNpR0z59TMRp2xX5G28x6NsqG/vXUOOmuXm0t/eAbyxGfWZ3ZnqFv8HNYYA0UH+Pmx1jZkuPeACusvfz64a/08sDJXLQ3OsLvy3mnA/MLJc994edrpKUuDx6GV7eIIpEG5Ln1X+oI82MP+dzrR0VoLiK92QnrmjOh8Z94xZxuN0sz9dY4UNJRxlQu7/UeEbW3QYQiPB+Zo4ApFgOvlsPneV60rapmFsyHXCIYyewVb7w/E9gqaRpWdYE5ERBoO6cIy7/ElzItaDvpS+OYOaQ6OLccyY0quYgFrahDhvDuW1dDIndpdwCEPllGxs9rSKPNuN0EaNrHio4Nr70fdzhFkZJUrgGCBBzsFa2BBBe6rxgDDDNsDVjaMNflKtfp5/RbW
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4104.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2134f2fd-df9a-4f6f-8b4c-08d822758b6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2020 12:59:11.6992 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8LapMRvgOBRkzZb1HF2tiGrLCF84ig+ETEdbHBwif31lYWc2YHXszY0KqzmkoPSGyK29DWNlkqXwNjN9LX+2TQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4214
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_085921_391458_99EBABE5 
X-CRM114-Status: UNSURE (   6.65  )
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
Cc: Jose Abreu <Jose.Abreu@synopsys.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

SGkgT2xla3NpaiwNCg0KVGhhbmtzIGEgbG90IGZvciBhIGRldGFpbGVkIGV4cGxhbmF0aW9uIGFu
ZCBhZHZpY2VzISAgDQpDaGFuZ2luZyBwaHktbW9kZSB0byAicmdtaWktaWQiIHNvbHZlZCB0aGUg
aXNzdWUuDQpUaGFuayB5b3UgZm9yIGhlbHAhDQoNCkJlc3QgcmVnYXJkcywNCkV2Z2VuaXkgRGlk
aW4NCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IE9sZWtzaWogUmVtcGVsIDxs
aW51eEByZW1wZWwtcHJpdmF0LmRlPiANClNlbnQ6IEZyaWRheSwgSnVseSAzLCAyMDIwIDg6MTgg
QU0NClRvOiBFdmdlbml5IERpZGluIDxkaWRpbkBzeW5vcHN5cy5jb20+DQpDYzogQWxleGV5IEJy
b2RraW4gPGFicm9ka2luQHN5bm9wc3lzLmNvbT47IEV1Z2VuaXkgUGFsdHNldiA8cGFsdHNldkBz
eW5vcHN5cy5jb20+OyBsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnOyBKb3NlIEFi
cmV1IDxqb2FicmV1QHN5bm9wc3lzLmNvbT4NClN1YmplY3Q6IFJlOiBMaW51eCBrZXJuZWwgY29t
bWl0ICJhZGQgcGh5LW1vZGUgc3VwcG9ydCBmb3IgdGhlIEtTWjkwMzEgUEhZIiBicm9rZSBFVEgg
Zm9yIFN5bm9wc3lzIEhTREsgYm9hcmQuDQoNCkhpIEV2Z2VuaXksDQoNCkFtIDAzLjA3LjIwIHVt
IDAxOjI4IHNjaHJpZWIgRXZnZW5peSBEaWRpbjoNCj4gSGkgT2xla3NpaiwNCj4gDQo+IFN5bm9w
c3lzIEFSQyBIU0RLIGJvYXJkIGhhcyDigJxNaWNyZWwgS1NaOTAzMSBHaWdhYml0IFBIWeKAnSBj
aGlwIG9uIGl0LCBib290IGxvZzoNCj4+IFN0YXJ0aW5nIG5ldHdvcms6IHN0bW1hY2V0aCBmMDAw
ODAwMC5ldGhlcm5ldCBldGgwOiBQSFkgW3N0bW1hYy0wOjAwXSANCj4+IGRyaXZlciBbTWljcmVs
IEtTWjkwMzENCj4gR2lnYWJpdCBQSFldIChpcnE9UE9MTCkNCj4gV2l0aCByZWNlbnQgY29tbWl0
IGJjZjM0NDBjNmRkICgibmV0OiBwaHk6IG1pY3JlbDogYWRkIHBoeS1tb2RlIA0KPiBzdXBwb3J0
IGZvciB0aGUgS1NaOTAzMSBQSFkiKSBFdGhlcm5ldCBzdG9wcGVkDQo+IA0KPiB3b3JraW5nIG9u
IEhTREsgYm9hcmQuDQo+IA0KPiANCj4gSXQgc2VlbXMgdGhhdCB0aGVyZSBpcyBhIGxhY2sgb2Yg
KnBoeSogY29uZmlndXJhdGlvbiBpbiBoc2RrLmR0cyBmaWxlLCBzZWU6DQo+IGh0dHBzOi8vZ2l0
Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3N0YWJsZS9saW51eC5naXQvdHJl
ZS8NCj4gYXJjaC9hcmMvYm9vdC9kdHMvaHNkay5kdHMjbjIyOQ0KPiANCj4gV2hhdCBmaWVsZHMg
ZG8geW91IHRoaW5rIHdlIHNob3VsZCBhZGQgdG8gdGhlICpldGhlcm5ldC1waHlAMCogY29uZmln
dXJhdGlvbj8NCj4gT3IgbWF5YmUgc29tZXRoaW5nIGVsc2UgaXMgY2F1c2luZyB0aGUgZXRoIGlz
c3VlPyBEbyB5b3UgaGF2ZSBhbnkgdGhvdWdodHMgb24gdGhpcz8NCg0KU2hvcnQgYW5zd2VyOg0K
bWFjOiBldGhlcm5ldEA4MDAwIHsNCiAgLi4uDQogIHBoeS1tb2RlID0gInJnbWlpLWlkIjsgKG9y
ICJyZ21paS1yeGlkIikNCiAgLi4uDQp9DQoNCkxvbmcgYW5zd2VyOg0KQWNjb3JkaW5nIHRvIHRo
ZSBSR01JSSB2MS4yIHNwZWNpZmljYXRpb246ICJQQyBib2FyZCBkZXNpZ24gd2lsbCByZXF1aXJl
IGNsb2NrcyB0byBiZSByb3V0ZWQgc3VjaCB0aGF0IGFuIGFkZGl0aW9uYWwgdHJhY2UgZGVsYXkg
b2YgZ3JlYXRlciB0aGFuIDEuNW5zIGFuZCBsZXNzIHRoYW4gMi4wbnMiDQoNClVzdWFsbHksIHRv
IGdldCB0aGlzIGtpbmQgb2YgZGVsYXkgb24gdGhlIGNsb2NrIGxpbmUsIHlvdSBzaG91bGQgbWFr
ZSB0aGUgY2xvY2sgbGluZSAxMC0xNWNtIGxvbmdlciB0aGVuIHRoZSBkYXRhIGxpbmVzLg0KDQpT
aW5jZSBpdCBpcyBraW5kIG9mIGNvbXBsaWNhdGVkLCB0byBhZGQgdGhpcyBsb25nIHRyYWNlcyB0
byBhIHRpbnkgZW1iZWRkZWQgYm9hcmQsIHdhcyBpbnRyb2R1Y2VkIHNwZWNpZmljYXRpb24gUkdN
SUkgdjIuMC4gSXQgYWxsb3dzIGZvciBNQUMgYW5kL29yIFBIWSB0byBoYXZlIGludGVybmFsIGRl
bGF5LiBBIGRldmljZSB3aXRoIGludGVybmFsIGRlbGF5IHdpbGwgYmUgY2FsbGVkICJyZ21paS1p
ZCIuIEluIHRoZSBrZXJuZWwgaXQgaXMgcHJlZmZlcmVkIHRvIGFkZCB0aGlzIGRlbGF5IGJ5IHRo
ZSBQSFksIG5vdCBNQUMuIE90aGVyd2lzZSBpdCB3aWxsIGJlIGEgYnVnIGFuZCBzaG91bGQgYmUg
Zml4ZWQuDQoNClNpbmNlIG1vc3Qgb2YgZW1iZWRkZWQgYm9hcmRzIGRvIG5vdCBoYXZlIHJvb20g
Zm9yIDE1Y20gY2xvY2sgdHJhY2VzLCB0aGVuIGluIG1vc3QgY2FzZXMgJ3BoeS1tb2RlID0gInJn
bWlpIicgaXMgbm90IGNvcnJlY3QuIEl0IHdpbGwgd29yayBhcyBsb25nIGFzIFBIWSBkcml2ZXIg
d2lsbCBiZSBmaXhlZC4gTGlrZSBpbiB0aGlzIGNhc2UuDQoNClBlciBkZWZhdWx0IEtTWjkwMzEg
d2FzIGNvbmZpZ3VyZWQgYXMgInJnbWlpLXJ4aWQiOg0KLSBubyBkZWxheSBvbiBUWCBwYXRoIChN
QUMgdG8gUEhZKQ0KLSAxLjJucyBkZWxheSBvbiBSWCBwYXRoIChQSFkgdG8gTUFDKQ0KDQpJZiBp
dCB3YXMgd29ya2luZyBvbiB5b3VyIGJvYXJkIGluICJyZ21paS1yeGlkIiBtb2RlLCB0aGVuOg0K
LSB0aGUgTUFDIGFkZGVkIHNvbWUgZGVsYXkuIGluIHRoaXMgY2FzZSwgbW9zdCBwcm9iYWJseSBp
dCBpcyBhIGJ1ZyBhbmQgc2hvdWxkIGJlIGZpeGVkIGluIHRoZSBNQUMgZHJpdmVyLg0KLSB0aGVy
ZSB3YXMgbm8gVFggZGVsYXkgYW5kIHRoZSBQSFkgd2FzIHdvcmtpbmcgYnkgYWNjaWRlbnQgb24g
dGhlIGVkZ2Ugb2Ygc3BlY2lmaWNhdGlvbi4gRGlkIHlvdSBoYWQgc29tZSBraW5kIG9mIHJhbmRv
bSBwYWNrZXQgZHJvcHM/DQotIFRoZSBjbG9jayBsaW5lIGlzIGFjdHVhbGx5IDEwLTE1Y20gbG9u
Z2VyIHRoZW4gZGF0YSBsaW5lcy4NCg0KQmVzaWRlLCBwaHkwIG9uIHRoaXMgYm9hcmQgaXMgYm9v
dHN0cmFwcGVkIHRvIHRoZSBhZGRyZXNzIDAsIHdoaWNoIGlzIGJyb2FkY2FzdCBhZGRyZXNzIG9u
IHRoZSBNRElPIGJ1cy4gUGxlYXNlIGRvbid0IHVzZSB0aGlzIGFkZHJlc3MgaWYgcG9zc2libGUu
IEFuZCwgaXQgaXMgcHJvYmFibHkgYSBnb29kIGlkZWEgdG8gYWRkIGluIHRoZSBjb21tZW50IHRo
ZSBwYXJ0IG5hbWUgb2YgdGhlIFBIWS4g0JFlY2F1c2UgcGF0Y2hpbmcgUEhZIGRyaXZlcnMgaXMg
dXN1YWxseSBkb25lIGxpa2U6ICLRgtGD0YjQuCDRgdCy0LXRgiwg0LHRgNC+0YHQsNC5INCz0YDQ
sNC90LDRgtGDIiA7KQ0KDQotLQ0KUmVnYXJkcywNCk9sZWtzaWoNCg0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBs
aXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=

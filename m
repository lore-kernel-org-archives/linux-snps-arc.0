Return-Path: <SRS0=bl4Q=7V=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C31FC433E0
	for <linux-snps-arc@archiver.kernel.org>; Mon,  8 Jun 2020 04:18:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B92E020774
	for <linux-snps-arc@archiver.kernel.org>; Mon,  8 Jun 2020 04:18:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Tv/ENFXU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="gnvSC7UO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="R7ITj/hI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B92E020774
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mqxSDvspvEpBarj+5LLjxMVFCdSBf3TYw3cse/i1lWY=; b=Tv/ENFXUedbC2l
	flD5gXzl9931HRAeFrnaj/jt6RAgxMz+wIX6Dg4IxYT70KazRqi8VzzY1gcoWPmChkXasMq8EKiDR
	pJvwUPiWC6RNTwY0jNqTRGq+xsNb1n3r1hS4ub2jwpMpmEcQ8NAV0fyBPfnZeOBCpI7J9t523DBtr
	9vwy+CiSKYu8xXT9lF8STDSAM4O9WtV9KSb697Ffz65095Bw4Y8oZFKoj/eyZ76+yIqLRqMiCWTau
	u+dhalMJ6MbygYCvdO/e87aheM6cUPDhxS9ef1CKZl62z4z+ME9iKe9Jc5FihUSUUMZLCQ2AMTCB8
	9NBifaOS89hH2zPN7qIw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ji9Eq-0006Vf-GB; Mon, 08 Jun 2020 04:18:20 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ji9En-0006VG-U2
 for linux-snps-arc@lists.infradead.org; Mon, 08 Jun 2020 04:18:19 +0000
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A131F40651;
 Mon,  8 Jun 2020 04:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1591589894; bh=I+E7qR0Y4ff6btFbBCAiRVfCZzznD83tEIjEFDdP41E=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=gnvSC7UOF7T5bVrZGeBf90gPl3qGfizevBLjJAT98OSYlxPTl3b4RZQmBWGqW8B0c
 cMPUTadmlD7D7I27X0j3s+nvP6tOZduWuvsCbCY5GwrvftYZ7SFx5AhCraL+EuiZ5N
 DIIsY7xE0pFIfwaK7c5sFx2KCd07zX2EMbGUKsOdMcZzFTk6jpFJf+CWBCv5PEzavT
 DfcsLkmptUThqxKNr6+29eRSlAiOkOEF37TBwln+Ey/g1zmglOmRjxaX+M37NR7Rnh
 J5Uu+2hZ2jVRG+UMowdpTRgzICXMWcfWmixQqkn8qSskebOGLR5JdhGDHT07RN8hc/
 zv8O6KmhtktRA==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com
 [10.202.1.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id A1526A0077;
 Mon,  8 Jun 2020 04:18:11 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass (mailfrom) smtp.mailfrom=synopsys.com
 (client-ip=104.47.55.175; helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=vgupta@synopsys.com; receiver=<UNKNOWN>)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="R7ITj/hI";
 dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 4A2E7400E8;
 Mon,  8 Jun 2020 04:18:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aFrVlvzeiszl0Ov3gJkl8aNlI207uMI9O4eHaCu9N2VWflaqGGwQlBPJCgwZ/Db8SPdamr3UrN06fQGha1Rkj2mwp00N/Fdac2svdDkFfE9r60J1gYMzmgMVphxtA+Odu5x2s2rm8UZD2vNDBnLQSQsYUsDvm6xWcVqrwQ7ZzCVSmKv8TUuonf0TGwT/E4XceohB82in96ck+k8aNm3fnojrzCofHgaD89vOSVNHVvEGkxO6gn777Y4NO9RwTwmp9793JgSdd8eDIuJTLHoH8IasE28v4RdHFhq0p0X4tQwfd3kajimXLnTH3K4f/kXtt+zTQiwtSx4Bd2ezJ88bkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I+E7qR0Y4ff6btFbBCAiRVfCZzznD83tEIjEFDdP41E=;
 b=LJb17Ijf1o3+Qlq1lkSCHlm4v1Q7B9tBzE95PjibNB+zxvyjAWNH8VgP+w9NjqxUzva1MKx55mb7apDzb+p2zxmfPRLIUfiD6VpJ2GZ3mMi0XZQMzhBSZNsUrNy352NqWZnFW1ZFDzQxlYJJ2f50EIYmkqS/NqoRtONC0foxgRBkVYrzIJ5qbf5sufYq/1zJQdMELEF+EFOFjCLO7wFS0zRJ+rKh0F+iAcKKDXv0G9Z2qFCVnBmCsbPEjaWbkfSR1EObHHsb03ScNxb6zZvD45hWTsnYDBGTLhNb1qlesxnfg3/uHzeLg4lg12wZoIkOrHZKbX/FMqLkReH9PiYzag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I+E7qR0Y4ff6btFbBCAiRVfCZzznD83tEIjEFDdP41E=;
 b=R7ITj/hIZW/mH4c7WAOcLpozjz32V5WKft6pYOMmP9wmaSmTtfvpwGRT2EYqUZh+bI9oi04zpw2PfAx4MoZFZjpwP5FKmH4xarCaoVb7qnfooD1bfnfbj9GMpnUDroUUqM/7nm1gIEr8Ij1flIiKDvVJ/wEobjZNHUM6pgxGyV4=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB3192.namprd12.prod.outlook.com (2603:10b6:a03:139::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.20; Mon, 8 Jun
 2020 04:18:05 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af%6]) with mapi id 15.20.3066.023; Mon, 8 Jun 2020
 04:18:05 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Adhemerval Zanella <adhemerval.zanella@linaro.org>,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Subject: Re: [PATCH v6 11/13] ARC: Build Infrastructure
Thread-Topic: [PATCH v6 11/13] ARC: Build Infrastructure
Thread-Index: AQHWOeLPJyHsygQNxEG0Cla1E8Xp4KjIlN2AgAAcKwCABXLOAA==
Date: Mon, 8 Jun 2020 04:18:05 +0000
Message-ID: <cce8e932-ef82-d98c-b37b-65aefb19ee8b@synopsys.com>
References: <20200423014126.10417-1-vgupta@synopsys.com>
 <20200423014126.10417-12-vgupta@synopsys.com>
 <fe061156-0870-086d-72b7-a006ec8421c7@linaro.org>
 <d64e6491-c5de-4c43-4e8e-d56ca77e662c@synopsys.com>
 <98aad6dd-dd47-a5af-eb36-8203a080ee01@linaro.org>
In-Reply-To: <98aad6dd-dd47-a5af-eb36-8203a080ee01@linaro.org>
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
x-ms-office365-filtering-correlation-id: 3868df29-0350-4fed-a3a4-08d80b62f144
x-ms-traffictypediagnostic: BYAPR12MB3192:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB31923E77808FFF30C8EF0F5DB6850@BYAPR12MB3192.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1775;
x-forefront-prvs: 042857DBB5
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MYQFenOjjFy6zf6JRW3/cz2bz0vkWckXweHjrDEAF/KxVVKBBmianvgQ/Fw/vHll+U7mhnkWlYUGUPEwkKrXEASCtT7slx6c5kPmUR+ltXedCzeMcAgeUoTBKliWRF/PZIKuwLOMcgzfFmyVXwH+JOo0jySQ2+hqbTW3ubAXd80zd1Y20GjgH3Lp3ExMG1UacDUlW08fVW4zjcMZPK3lAEJ/1rvyQTYfWXkddM0UJHgsIHCzpK9vTwRji9oGuIfDtVqOsqenPwQXXZDIqZsZzuMcwg+EJsuyQjGr23/IXqtvzpwRl7B8x7lP9DbAkfL0oo/8xCUYwu0oYJlj2Tasg+mQZDBsgMim5Ts/eCLLpKkOBGk5Sy4S43dfDTwJCnzI
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(136003)(366004)(376002)(396003)(39850400004)(346002)(5660300002)(31686004)(2616005)(2906002)(316002)(8936002)(8676002)(110136005)(86362001)(186003)(4326008)(64756008)(36756003)(6506007)(53546011)(76116006)(66476007)(66946007)(66446008)(66556008)(71200400001)(83380400001)(478600001)(558084003)(6486002)(6512007)(31696002)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 63plPcapvDEHuL3/2bD6KgQZN1ZcMh2xuZMaWbuWRRT3oUKpBRJ+mLH2s525XqM5fsxeo+E82A7mfd6AjfjS+Mi/6fiohN5p4dVG6xBnZfBAmfqO6+DH1zeCoOC1OjsfholFlTonTExZ0E0w7IX2maUJe5T9vZbSlyTbhl3ZhozPaaL2B4gG5JJL9wcqe2zJmSiX5t6sm7UMJ9dMyK/OHAbEShKv/xVOZmbMW0YpLJrSBLEo48XPY7H1KWm8k/Oj5RY0khtNnn9YDWpNIXmULFP0GFiGGsKruspoxe4sSJa9WPklg/ocKnGTkdRAixZcDtJBj2X5/RV8hsJx+dsdajd9JrAFNRTH5nBlqcUqvDp4QhYckdQsUkf1Ok124edlncYYBXgVx5UGg9pw+OBEcui8U/xzcDCFA5KcTXq03kN5gYiCXEP0NZzP0m5jh+88hVC2ayFqdghUmHsGJSYVUuURWWJzTIGB06eDudKU1huyxL6lPUwCBbk2qpZ16kfyAVWMp3tc+m5Qnu6JRaNsIcwc4/SJMN32eJx4QBajZeP86xSSsWbMLUv/UW3qAHxj
Content-ID: <DD26B3ED7A29E144A385B678EE3F003D@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3868df29-0350-4fed-a3a4-08d80b62f144
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2020 04:18:05.4333 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aLQf8EN22c8P953ohroLfQ44imBBuMqe1XHkCw/vcygrKV2JLE614xT/Z2zX5DomkT0hDZCBgjoqGs8C7Ufw/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3192
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200607_211818_060007_BB723789 
X-CRM114-Status: UNSURE (   9.88  )
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
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 6/4/20 10:05 AM, Adhemerval Zanella via Libc-alpha wrote:
>> We inhibit small data explicitly which by default kicks in.
>
> Ok, is it some limitation for loader bootstrap or something else?

No, the gcc driver defaults to using small data which is too small (no pun
intended) for glibc needs.


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

Return-Path: <SRS0=zpCG=D6=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5974C4363A
	for <linux-snps-arc@archiver.kernel.org>; Fri, 23 Oct 2020 02:35:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D90B921556
	for <linux-snps-arc@archiver.kernel.org>; Fri, 23 Oct 2020 02:35:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="erslKMPe";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="OE/OdGx7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="HWfviiVF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D90B921556
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:Message-ID:Date:Subject:To:
	From:Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DWAaa3/Y6A0bakAXX0/SS6dCchC0Li6II9taFTaXEUg=; b=erslKMPeu6w++xqSTL1ZF+dlrs
	Ni0elnDcd14a5OOzDWyNh0ypeIJaZ4zswmXPBbTO1BzKu5lukSXgYBBhKQHJ0HcRHyOH6fsq0AMB/
	dtCCEH2XghbICUmyJkbJu9gp6sPb5fotsygvWfLJDewdO9gG8q+KLrLoTUmGgLIjeFz0Ajj19r7QZ
	+bf3Ks2zAXcVqk/Is5SP34oTzsxeh78otaljodJ17okWcZ2CGXNSsCtHiCJMFVsURUOFeFKV/QThN
	rxY53N5bIsvxCRmzD8n+TsnZyvwr/QM4rjW5mxZq+vM4UosifJ2s+hkERvaen46zo6/TKjEKGbwwk
	7s/oHEbw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVmvh-0007JT-Df; Fri, 23 Oct 2020 02:35:45 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVmve-0007J2-FQ
 for linux-snps-arc@lists.infradead.org; Fri, 23 Oct 2020 02:35:43 +0000
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com
 [10.192.0.81])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id ED127C054E;
 Fri, 23 Oct 2020 02:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1603420538; bh=VIP1cRP1yu93+SmT2c3c3lItvR5rgDoj4Wehjf47yvs=;
 h=From:To:CC:Subject:Date:From;
 b=OE/OdGx7LoE6fUGII4VIPuicSNAYK1FWrzR+V18Nz0GHEjCSO+Zp98bcPv78CiLlz
 OA+BGIX7rajTIn0742DNI40xA9d6ATAwXduLPkAiUBPNQPwM5UYi33m2SaYFgiGU9V
 pXDvLBZjHyLEId7zvH9ojQRWhjSmGYkXR2UF7mtVVGTzwsxUla52yF28/AgHhU4ojz
 v4ve7vQwrMm8PvMSBxMQGa3Svor/J3v5+KktJZg5y5SQ7ooQm+bICpV3n/6LVcVZ05
 gPUq8mAVwFuGQFOEZElJ+up9hV6/mplX12yBzahlu5cKMHE8sriw8nIhRkp35/AykV
 Oer/c3aciC/wg==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com
 [10.202.1.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 4F5B6A0068;
 Fri, 23 Oct 2020 02:35:36 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 76D84400C9;
 Fri, 23 Oct 2020 02:35:35 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="HWfviiVF";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gI/9a4ekLJCxOVUygbm6lBehp0YuezfftM85Z90R2Lt22CR40hybOWz0RQwJCc9G34KgqljGZypRetcVv5POqmIzR+pQuWasPzeeKPWYYfF9s3fG1mLthipWfbNZICwQaq0CCWj+6yNx188k5XFBWLpChO2Kf3Vlh//BB94orrhuzzOv9ED+oSAqo0FT/ZNXm8C5ESz1m19gmk1Ml8D2uq3ha+Gk1tZVioHvBkRnI9aLNyFrZmdYUVJ9WHR7ELWzDZDBkx8XHS1xfQXCHl3qMrKAAu91ESRUPId1DwAeiTEr/fH/qTxN9LsIWnzM20iv+OArQjwPaGsellWOMFcuKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VIP1cRP1yu93+SmT2c3c3lItvR5rgDoj4Wehjf47yvs=;
 b=DTOlevukP+5YpqfLH8vzSMXG7eygTqyosJEvxZyFmkRVpd9HixIQRpmgcxtq2ht3qLnKxBZF88qy57upzmYypgI/D84awbjGtb8tyqoRZqtqGL9N8eXZ111lrN05hWW0DkKTd3E4Xn1cmSgvbvF2yaAtf9jT2fLHrj8pxZyscPHOlnFez8SMR3f3CDAdWvdoA9XqAADyYxUNvf42ApewVPz5vInfvvsaCDOQdNLeeeDZmr8XKo7Yg/K4di+9w63vZQJFN7eTuI4v/IgbyJwT3h5Gz23sEybL8gA62eBDd/0dK78mdwBFTCNm/NfbxuY4/NIK5402IlAVfJwmoWj/2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VIP1cRP1yu93+SmT2c3c3lItvR5rgDoj4Wehjf47yvs=;
 b=HWfviiVFcMs2VglSua6cl6H4GcNK4FzVQcYb4hLXBUCi6N+3a2VeeOncs1tIPErrsh2409EvEyD21Nf4WOtUdd1zaFoM+NZNp/C/naI75sAKBHQEg5Xq4qNrv2X11arqtyiQlRTYu8bhDycMcooNCwx4XNOuV0Egkge3MPgbsek=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB3477.namprd12.prod.outlook.com (2603:10b6:a03:ac::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Fri, 23 Oct
 2020 02:35:33 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::c562:e026:68d6:cd31]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::c562:e026:68d6:cd31%6]) with mapi id 15.20.3477.029; Fri, 23 Oct 2020
 02:35:33 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] ARC fix for 5.10-rc1
Thread-Topic: [GIT PULL] ARC fix for 5.10-rc1
Thread-Index: AQHWqOUuDkpUarYknUu/NJxjRrJMZA==
Date: Fri, 23 Oct 2020 02:35:33 +0000
Message-ID: <cb7b01ac-abf5-b6df-3f15-a7a20533a89f@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [24.4.73.83]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 147ee2de-0fa9-453f-eff2-08d876fc50ec
x-ms-traffictypediagnostic: BYAPR12MB3477:
x-microsoft-antispam-prvs: <BYAPR12MB3477AD7E50BD26292289A025B61A0@BYAPR12MB3477.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1850;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0kt2NuCZ2Go8IjX4vA9P2xfP3kA48yuGd+HoUZb9JIYGPlMMOefozFWwRv9VrrgqDcYhTRcZC0VT5mOs8PEJRzkPMvOQZMp1fJ2YShXdL2EP0vhG39ae3hDjNmtvmHz8uDY95kMZ4dPMNwi2/4kJRBtfggrbdRDLD8pZESCXSnZdDMHrmagcWgju4cPws8wT4d3i6Ip1+ub90VHQA8FtjkHmKf6le0qgWjeiF+phjU4yJy5R8k+TQE+TtPkq+/rdUUdWkluLtjTqoSMLI4zXO8j5Us8syMHZSmhMiRFhiA/Qk+SHKP3S2Zw3C7qQoi+iamc1pt+3McN/yRSB14Ep16pYFz2Xerd8WcR6szdgt4+Pf+v0nK9MqZNUC/Yb1hqj
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(366004)(136003)(376002)(39860400002)(64756008)(6486002)(186003)(6512007)(66476007)(66556008)(66446008)(66946007)(26005)(31696002)(83380400001)(76116006)(8676002)(4001150100001)(8936002)(71200400001)(4326008)(5660300002)(478600001)(6916009)(86362001)(2616005)(36756003)(31686004)(54906003)(2906002)(316002)(6506007)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: N1E1uDqTjEYuyQQe/xDYVp0OWT4+HARf14dyvBkv0Xybsa+V2YC4J+5GT8vZ7xkokCtRlsk86wcHTE1hOD1WKoG0vinOdJEnWXJ2ieuHGZ9STy+m6PKSf6tuZldbIdK6q32oPtr+pSrhsy4eekgKCuwl/vg31VWqR2b6Finnzgo9us4l/w7doR8BxLEoWr97UmZGNwmn5QDHb+6shVQw2Dj/o96nySe107gxPW/6eA7WjS3LiOidGAxO+wXDl2Hwd8J6ie3siz1dhGZutO/uBumwZV5nndcHtYs6raob754kbjPHIQjr4nwbfJ1t7cxSEjcXWzpcH5EVAB4YKPIgoTylFj9PZ+tbWKF1T9BM7adaJZccvR6bBUfz+L2aoJMVaew8AsF9Z7GepX94LnZf55VHB4Nd0d13H0oFIGnhn2Nj2OLCzy7JSZHXtEycej3I8RGeNaxb620Y1LR6awqaoZyCZRMGdhUztyGmOYNKZNLaPsrkICsPwmJqolEL+52s8QMQADG485XNLuMAi6oSiEIrXj9hx6eBp3wSjy6qRH74oEieYNez4AUcezKGa8ysi5hHtEGc3B6jl80IoFYYvD6eaduu65lNFARUQ4Afq6RANz8m7LK5lwuHmwZvG1w5rxm1SZj5kTZySlcy6CiUCg==
x-ms-exchange-transport-forked: True
Content-ID: <6A7535DCE0D00248877E1725C973AD96@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 147ee2de-0fa9-453f-eff2-08d876fc50ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2020 02:35:33.3017 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LulaKQGF4pK53qENyqrppEUeqHEWGmMHgrYh5Ktm8RDULtQDd8NmAFQyuUWbzEKntBrn4zmMo0TgfVryZXA1jQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3477
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201022_223542_970473_7A4FB229 
X-CRM114-Status: GOOD (  13.31  )
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
 lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Linus,

This is an unusual 2nd pull request for merge window. I found a snafu in perf
driver which made it into 5.9-rc4 and thus the fix could go in now than wait for
5.10-rc2. Sorry for the trouble.

Thx,
-Vineet
--------------------->
The following changes since commit 6364d1b41cc382db3b03cf33c57b6007ee8f09cf:

  arc: include/asm: fix typos of "themselves" (2020-10-05 21:02:29 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/
tags/arc-5.10-rc1-fixes

for you to fetch changes up to 8c42a5c02bec6c7eccf08957be3c6c8fccf9790b:

  ARC: perf: redo the pct irq missing in device-tree handling (2020-10-22 10:57:58
-0700)

----------------------------------------------------------------
Urgent perf ARC fix

----------------------------------------------------------------
Vineet Gupta (1):
      ARC: perf: redo the pct irq missing in device-tree handling

 arch/arc/kernel/perf_event.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

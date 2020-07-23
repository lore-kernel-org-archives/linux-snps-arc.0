Return-Path: <SRS0=fVAe=BC=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=3.0 tests=BAYES_05,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_REPLYTO_END_DIGIT,
	HEADER_FROM_DIFFERENT_DOMAINS,LOTS_OF_MONEY,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,SUBJ_ALL_CAPS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D0D3C433E4
	for <linux-snps-arc@archiver.kernel.org>; Thu, 23 Jul 2020 19:50:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 220F12067D
	for <linux-snps-arc@archiver.kernel.org>; Thu, 23 Jul 2020 19:49:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fCd5tdoj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 220F12067D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=znettelecom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:From:To:Subject:Content-Description:
	MIME-Version:Cc:Content-ID:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PxpnoAzTd5nRF16IVHLfKycikBy1yg74ustDyLuhDj0=; b=fCd5tdojxsaEi9jVuZrOn4Weae
	yUbdwGVgNjkexSfoC/7x9VwgVXqQVxh81MyB50+ij0NZoyt7Yw2kUQa7I7EgSX/wazrZCJM4gxZD1
	FkQuEjeY4g0PYxvzXGhiYrAFhvpBEtTmI4aQ5hkXtnV/CSeoF6C3vJvvXjikmEetiC+hQaa4lI6fu
	W67bPRnVo4xAaZ1QO4zYTLqRrK/F7Yqst/u6N/bljRVD7C/99RHMv4ehrgQsO58DCpGm1NPZcp20v
	0itmf1ZJgDOcCgO9vizEtJPJpe6jdoNXL2z8QXSobQurB93rkw2djIs+eJUfqAM/hGrDzToKpUUSW
	ubu0vdZg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyhDz-0000qK-G0; Thu, 23 Jul 2020 19:49:51 +0000
Received: from [187.0.30.10] (helo=srv01.znettelecom.net)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyhDh-0000iC-LR
 for linux-snps-arc@lists.infradead.org; Thu, 23 Jul 2020 19:49:48 +0000
Received: from 132.205.136.77.rev.sfr.net ([77.136.205.132] helo=[172.20.10.2])
 by srv01.znettelecom.net with esmtpa (Exim 4.92.2)
 (envelope-from <alan@znettelecom.net>) id 1jyhDV-0000NL-TS
 for linux-snps-arc@lists.infradead.org; Thu, 23 Jul 2020 16:49:22 -0300
MIME-Version: 1.0
Content-Description: Mail message body
Subject: DONATION OFFER
To: linux-snps-arc@lists.infradead.org
From: "Steve lenka" <alan@znettelecom.net>
Date: Thu, 23 Jul 2020 21:49:11 +0200
X-Antivirus: Avast (VPS 200723-2, 23/07/2020), Outbound message
X-Antivirus-Status: Clean
Message-Id: <E1jyhDV-0000NL-TS@srv01.znettelecom.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_154933_742753_48CEA610 
X-CRM114-Status: UNSURE (  -4.65  )
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
Reply-To: stevelenkathomson12@gmail.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hello, Donation of 1,000,000.00 GBP given to you by Steve & Lenka Thomson, =
This is to help fight against Corona Virus and help the poor people off the=
 streets. send email for more details: stevelenkathomson12@gmail.com
Steve & Lenka Thomson

-- =

L'absence de virus dans ce courrier =E9lectronique a =E9t=E9 v=E9rifi=E9e p=
ar le logiciel antivirus Avast.
https://www.avast.com/antivirus


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

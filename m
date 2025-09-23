Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A15F0CAC5A5
	for <linux-snps-arc@archiver.kernel.org>; Wed, 24 Sep 2025 00:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:
	Message-ID:To:From:Date:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=fezwGW/M0bPOZA0ISKkhDICynadjxBw2IDOWsbhw/L0=; b=Aat
	m6FsNCXmo7BYlfFgifdOyrv4GUoFSQO9LwTUBOdXyQMTohFFP4qMi7lUGKwHlnUIR6MQwc/h8RnA2
	LQ0ks12ZPCMZmT6wF0WG2kftKcuTgpUOlKBkofy2sVQFv2piWa1bol1akDkkb0BDEgZHUbl5P+dbt
	ZrgqBM1iRGmmxXaRKLRqfRaf9a9PWMQZAhWfz3gCUwDvvrVseGFHnGEF7ORoljYWXA64954GbbEFK
	2mJAiSnG/iFkrNEjAXnnyGEA2yHnBRDthDAYX4gFrMOr9knnAkBjJK+YeRNPoY1sQt6w/gxv2J8xs
	n98bN/daFccZbTNioEx3ZwmvdPGNDeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Dc6-0000000FEW1-1jWt;
	Wed, 24 Sep 2025 00:44:06 +0000
Received: from sender4-g3-154.zohomail360.com ([136.143.188.154])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Dc4-0000000FEVV-0bZ1
	for linux-snps-arc@lists.infradead.org;
	Wed, 24 Sep 2025 00:44:05 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1758674643; cv=none; 
	d=us.zohomail360.com; s=zohoarc; 
	b=F36ARQ97MjWQVssrIZ3MAtRm8vgLVfoniEpanj+RpWv3AspBbNNJNxHCml2JTQA1paBDxiYF+6ZR6ndfgPr1bdLd298D3C61P8RMWwq5Afu458yc+6CsRihy+59m0SKXrhf7x1+PZRatDul0v/C45tslRHvKoh/T3nl93xKkNYI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=us.zohomail360.com; s=zohoarc; 
	t=1758674643; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Reply-To:Reply-To:Subject:Subject:To:To:Message-Id:Cc; 
	bh=sUF6rtJXbCb6CjmxVcTvh7ApFxKbK0PfqQ4AdBD1rpw=; 
	b=jVOqJd1C/pKAJNf9QJcyVMwR/I3o97ynY/x3KhoBHlj7X6Ks9uT3v1VvZ/RDE1K4g0WEN1R/Oz6/c3lrWI/zcAvSlAb2M77hF3ZunGSNLakodVDh7O/D+sq8Mj3qcuiGKqsDQUd1mOGoSN/aE/GyKJBlk2xpXbtXUZvSycuZIbM=
ARC-Authentication-Results: i=1; mx.us.zohomail360.com;
	dkim=pass  header.i=maguitec.com.mx;
	spf=pass  smtp.mailfrom=investorrelations+9ab53490-98d8-11f0-8217-5254007ea3ec_vt1@bounce-zem.maguitec.com.mx;
	dmarc=pass header.from=<investorrelations@maguitec.com.mx>
Received: by mx.zohomail.com with SMTPS id 1758671653200638.8097416477644;
	Tue, 23 Sep 2025 16:54:13 -0700 (PDT)
DKIM-Signature: a=rsa-sha256; b=MAh6+AZxkxCJ0xZqZSuvuBZPao0BfXer3rQSxt3uHvt3Cd0ZLsbRT9+lCTf1TKbwJd0M5CGIFPs9Vw4n9Z9N1yMjWyHpPgK/vPs73Uh/2wvBn6fODeVuNwMf8Ij0XHtnslUdi2kPzEl0wdfuCJP36meOoZBAnysj7r/TPgNFqbU=; c=relaxed/relaxed; s=15205840; d=maguitec.com.mx; v=1; bh=sUF6rtJXbCb6CjmxVcTvh7ApFxKbK0PfqQ4AdBD1rpw=; h=date:from:reply-to:to:message-id:subject:mime-version:content-type:content-transfer-encoding:date:from:reply-to:to:message-id:subject;
Date: Tue, 23 Sep 2025 16:54:13 -0700 (PDT)
From: Al Sayyid Sultan <investorrelations@maguitec.com.mx>
To: linux-snps-arc@lists.infradead.org
Message-ID: <2d6f.1aedd99b146bc1ac.m1.9ab53490-98d8-11f0-8217-5254007ea3ec.19978ffc659@bounce-zem.maguitec.com.mx>
Subject: Thematic Funds Letter Of Intent
MIME-Version: 1.0
content-transfer-encoding-Orig: quoted-printable
content-type-Orig: text/plain;\r\n\tcharset="utf-8"
Original-Envelope-Id: 2d6f.1aedd99b146bc1ac.m1.9ab53490-98d8-11f0-8217-5254007ea3ec.19978ffc659
X-JID: 2d6f.1aedd99b146bc1ac.s1.9ab53490-98d8-11f0-8217-5254007ea3ec.19978ffc659
TM-MAIL-JID: 2d6f.1aedd99b146bc1ac.m1.9ab53490-98d8-11f0-8217-5254007ea3ec.19978ffc659
X-App-Message-ID: 2d6f.1aedd99b146bc1ac.m1.9ab53490-98d8-11f0-8217-5254007ea3ec.19978ffc659
X-Report-Abuse: <abuse+2d6f.1aedd99b146bc1ac.m1.9ab53490-98d8-11f0-8217-5254007ea3ec.19978ffc659@zeptomail.com>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_174404_234510_2A86A823 
X-CRM114-Status: UNSURE (   1.96  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Reply-To: investorrelations@alhaitham-investment.ae
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

To: linux-snps-arc@lists.infradead.org
Date: 24-09-2025
Thematic Funds Letter Of Intent

It's a pleasure to connect with you

Having been referred to your investment by my team, we would be 
honored to review your available investment projects for onward 
referral to my principal investors who can allocate capital for 
the financing of it.

kindly advise at your convenience

Best Regards,

Respectfully,
Al Sayyid Sultan Yarub Al Busaidi
Director

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

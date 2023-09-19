Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 845B9EE0218
	for <linux-snps-arc@archiver.kernel.org>; Tue, 19 Sep 2023 07:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=o3lXZlLUoUA3acnDgtzCpXW5S1A4VRL6TjjobTC5nuU=; b=kx7SJ0Qfdhq00d
	IqTH/JrZm7yBvo7NZHiRvE8ot5VxZgppBDrFtr14grbdCicOKooUb02qFkvk7rg3cOxWo6d0TlB1z
	NVScw0GeF3xISXAkyOE/kx+p+A7zV3hE3NiRS3MCF7LYd0w/fDbgTun16kQuk6NlUSvHbJCECi8m8
	YV3a9FtyeCfeJrdsOYO4/biy+mQKkPTx8g3DUucMoWhDngEoQRMf1DGBKf/3rQr7YzU/tsRif9yWD
	aC+z+u5UtI65xZfwgkL5WiMZLU/Pc4e6pUUYpbl1coIOuHGyJViAUrRKluEr0tXMvPVsLbQrQqk8m
	2H6SxM9viXrm0EAAHj3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiVCS-00HEwj-1r;
	Tue, 19 Sep 2023 07:31:12 +0000
Received: from mail.leeswilly.pl ([89.116.26.225])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiVCP-00HEuy-2p
	for linux-snps-arc@lists.infradead.org;
	Tue, 19 Sep 2023 07:31:11 +0000
Received: by mail.leeswilly.pl (Postfix, from userid 1001)
	id 0E90F761310; Tue, 19 Sep 2023 09:30:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leeswilly.pl; s=mail;
	t=1695108667; bh=qCQG4c3C0tvkuSSy6okg6Td4OKi9mrw7rI9pE9SwJ9g=;
	h=Date:From:To:Subject:From;
	b=G87IbyEfzEXxAts54WRaUY2wH7uSAuv8rnr9S5/H8XgniJ8dgKBvW97sDbqPQzb19
	 FROVfOLS5EK96OYf3ZqXKUBkmveGStPqboxAiORQ8gRf2JLQd/UnaQhDWsTC+gkHxh
	 1medgOdKg89HtFgBsH2T+forjlOVjZujzg114h3iZQOiypoK5qo0Z+pTvN98ZPGT4K
	 jouDMlG41ReiXh3V+DqGPt+l8dihZkrfbfSbRLL9mTfAipayQLAN3JLZttpMErHMfn
	 0cN7pyz8zoISPZeXyGeMvKyNt38ONOrJg0fvwKGGMlTGPcLSMBYbAbKiMslTW7A5hL
	 iS2eEpoFuE5jw==
Received: by mail.leeswilly.pl for <linux-snps-arc@lists.infradead.org>; Tue, 19 Sep 2023 07:30:18 GMT
Message-ID: <20230919084500-0.1.3z.bbtb.0.i5424nbnhg@leeswilly.pl>
Date: Tue, 19 Sep 2023 07:30:18 GMT
From: "Jakub Lemczak" <jakub.lemczak@leeswilly.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: =?UTF-8?Q?Pytanie_o_samoch=C3=B3d?=
X-Mailer: mail.leeswilly.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_003110_065629_4CA5A73A 
X-CRM114-Status: UNSURE (   1.16  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

RHppZcWEIGRvYnJ5LAoKQ3p5IGludGVyZXN1amUgUGHFhHN0d2Egcm96d2nEhXphbmllIHVtb8W8
bGl3aWFqxIVjZSBtb25pdG9yb3dhbmllIHNhbW9jaG9kw7N3IGZpcm1vd3ljaCBvcmF6IG9wdHlt
YWxpemFjasSZIGtvc3p0w7N3IGljaCB1dHJ6eW1hbmlhPyAKCgpQb3pkcmF3aWFtCkpha3ViIExl
bWN6YWsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25w
cy1hcmMK

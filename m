Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1532CC433EF
	for <linux-snps-arc@archiver.kernel.org>; Tue,  8 Mar 2022 08:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4KPnshDarDmSQUnYxzUjioEKzhXTntkVnBIgIAulKYE=; b=qSWKcfI+ogmIlS
	ApY92YGPcAp0sLHkSXgPekLYJ5+CzttjZLelOnASQV9MoIji+K/5kXZytKxGMGMf2J+Il7gZCDDSK
	gTAuoMKM1+M+n/7Ja+Ya3ZSEwxjGysHe2qcDYYeNLLpcDMINiWVEHd97snyMV9t8DDbJHzTsxhiEt
	8C023ne7TWpWGaqEi2gTslBbX/E2JEImYNwI0DdVvjZik3lJJtGtaTfU8uud91VJaQR1sE0nueDe2
	DEpaFVxKSntgg+SdNX4+cYUpfk2D5NCoPzKu6xYSTB5j5FpoZxhavEaNqlk5tORx9Qx1DJSJ+O9Zi
	Sah3eqL/89dfjnLXRD9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRVWp-003Kod-FL; Tue, 08 Mar 2022 08:49:11 +0000
Received: from mail.olerise.pl ([46.183.184.59])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRVWV-003KhM-MV
 for linux-snps-arc@lists.infradead.org; Tue, 08 Mar 2022 08:48:52 +0000
Received: by mail.olerise.pl (Postfix, from userid 1001)
 id DAB8844318; Tue,  8 Mar 2022 09:46:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=olerise.pl; s=mail;
 t=1646729217; bh=ZNYiuZLXlxCdAPtstEG/gwJieB5RBwA/cHj1SZ3Mpl0=;
 h=Date:From:To:Subject:From;
 b=nmlhvzu46fL+HB62jUZtQwBjOC2y2KG4vbt18QQyTdmQaQ65AVazepL8VpolvOLF2
 ksmYEl9KnkWR9zewrB2vkFuxafMGYoLU4jP98iRfMu7GLLsLR65TNHbMMP2tj3fQyg
 CJso+Jbg/sMn5qw5RezE9u179hTBTlP3eAcWPdu2tMYRxKQdumKXT6HrFXrig1w39o
 zxnTi4KybCwHUCZvcfpOa9b3EmtvIWtqlU0LgkkJMuwR3+1AxaPhmdXwfOMRoXf/eq
 SSjV3az2W7rQYiTPEopG1FUirpM7zAHntlEN4DdgkMgIE7GfYZ87NLvm5H2dj3fm/u
 YCVHpqKG1XIuQ==
Received: by mail.olerise.pl for <linux-snps-arc@lists.infradead.org>;
 Tue,  8 Mar 2022 08:45:41 GMT
Message-ID: <20220308084500-0.1.26.msln.0.f0m7mke89m@olerise.pl>
Date: Tue,  8 Mar 2022 08:45:41 GMT
From: =?UTF-8?Q?"Miko=C5=82aj_Rudzik"?= <mikolaj.rudzik@olerise.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: =?UTF-8?Q?Nap=C5=82yw_Klient=C3=B3w_ze_strony?=
X-Mailer: mail.olerise.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_004851_918460_F55AEAC2 
X-CRM114-Status: UNSURE (   1.58  )
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

RHppZcWEIGRvYnJ5LAoKY2hjaWHFgmJ5bSBwb2luZm9ybW93YcSHIFBhxYRzdHdhIG8gbW/FvGxp
d2/Fm2NpIHBvenlza2FuaWEgbm93eWNoIHpsZWNlxYQgemUgc3Ryb255IHd3dy4KCldpZHppbXkg
emFpbnRlcmVzb3dhbmllIHBvdGVuY2phbG55Y2ggS2xpZW50w7N3IFBhxYRzdHdhIGZpcm3EhSwg
ZGxhdGVnbyBjaMSZdG5pZSBwb21vxbxlbXkgUGHFhHN0d3UgZG90cnplxIcgeiBvZmVydMSFIGRv
IHdpxJlrc3plZ28gZ3JvbmEgb2RiaW9yY8OzdyBwb3ByemV6IGVmZWt0eXduZSBtZXRvZHkgcG96
eWNqb25vd2FuaWEgc3Ryb255IHcgR29vZ2xlLgoKQ3p5IG3Ds2fFgmJ5bSBsaWN6ecSHIG5hIGtv
bnRha3Qgendyb3RueT8KCgpQb3pkcmF3aWFtCk1pa2/FgmFqIFJ1ZHppawoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGlu
ZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=

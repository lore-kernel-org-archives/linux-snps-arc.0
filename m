Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27199CCA47B
	for <linux-snps-arc@archiver.kernel.org>; Wed,  8 Jun 2022 08:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Kupcas9Jah/s4fs/uI5uUFRDCxFO6bWU8wX9W397Ybg=; b=DbdIzu2Jk9TMj1
	6ahlFxq4p8BSrYWU8oU2qs4yyiFZGwnFhMAlWRwkI/Ve5bffUWGlg/YHD/yf6qd/zA0jubLLtBLMx
	ziOUS0qZIHKVVnSGlHUM7up6DVpPeWisOi7eagpxblwwy3rV3Xs3TZfB9b6iCAF4FKX3ImkvGc4rB
	EoowolDwYp9A+15HOStXgNYjEzlfbt2KgMaTiCN7Jam1jevee9OO+uNGkKfnfrgsenuqxl72wYejm
	JEgmzwDhR/HEXZ1fi1aFxUpL2crqG22u4vDuDfZIzeBwoh7QcNnxiZgO+c1Jn67H5g5llXflt16VV
	BfBqvTwWxQBAmLQbPXHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyqqj-00BrqS-BG; Wed, 08 Jun 2022 08:15:33 +0000
Received: from mail.puregrowthonline.pl ([51.38.124.91])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyqqf-00Brnt-Sy
	for linux-snps-arc@lists.infradead.org; Wed, 08 Jun 2022 08:15:31 +0000
Received: by mail.puregrowthonline.pl (Postfix, from userid 1002)
	id 8EE6CA2AF1; Wed,  8 Jun 2022 08:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=puregrowthonline.pl;
	s=mail; t=1654676128;
	bh=CSKXLMgcdpWkXuTgJn5+jsCVobtU9JEF4vCnS5z6McM=;
	h=Date:From:To:Subject:From;
	b=GyQoqG7B70jMBsk5+qfuvdcvhUpmFvudE1lZoShSJ4JNUDCT3UGWzMv20opuAlztt
	 oQl0TAhR01wzTgX/oSC/cSEjrXlcHjg/QApTSfXHGbsjnSztR39zyFhpyX1uhCNlPC
	 UwUjnlfJhdHTIr+mfFOWiSZ7vbbPXoB72r6lMWGRdY0DCgcmwhsm5DZbV4NH6pDyso
	 6IuKOo/fKyQkkUlybCZSKWbPJgsnvXB1FhPniwbgVpZjKqvAT9+grr3Q+J1DHzDS1p
	 5WvsxSalcRJrOPaA8+74jHn+1frFeNPHNqyegp9I9TM7ICbgbUDWyrHYsxmAAORX9A
	 duu50jWWyWwAA==
Received: by mail.puregrowthonline.pl for <linux-snps-arc@lists.infradead.org>; Wed,  8 Jun 2022 08:15:09 GMT
Message-ID: <20220608064500-0.1.41.cz2k.0.2xfiu1mfj7@puregrowthonline.pl>
Date: Wed,  8 Jun 2022 08:15:09 GMT
From: "Wiktor Nurek" <wiktor.nurek@puregrowthonline.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: =?UTF-8?Q?Nap=C5=82yw_Klient=C3=B3w_ze_strony?=
X-Mailer: mail.puregrowthonline.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_011530_140351_B6C5BF4A 
X-CRM114-Status: UNSURE (   0.91  )
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
bnRha3Qgendyb3RueT8KCgpQb3pkcmF3aWFtIHNlcmRlY3puaWUsCldpa3RvciBOdXJlawoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1h
cmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=

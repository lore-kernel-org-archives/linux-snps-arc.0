Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEBC8E8FDD1
	for <linux-snps-arc@archiver.kernel.org>; Wed,  4 Oct 2023 07:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vFBkYdLge/NDS0rQME9MCyxeDoCYcB5P9osNTJwB+iU=; b=h6XskhXeV/7q9R
	H8HnGc0STmViVdJBFf4VRxz09ot7pWkI/czDhOFtn4aXSIzkq22bhBbdLhEafimE2DZH1wmFOtVGw
	3qKiou9AGbaYxvqQnBYiy79zpSz3nLNByQ3gPL9lBUyeq0LN41vs3RxoHqvaoO2fxE+WyMhqcZIZs
	xeVs8UdW8yyTfwIOjMq5wLPgCS2kk2IxTiwWc4cStJLBOWQte1gjCbDQnrwWuBI7CvGQ8KM/MEX4N
	sLECAt9WnMQF7URpsion210P/gXpp3y+Pjmzx/aMlBgPuiV1Ck8A/j+0173pQ6KG76ezpO/StvGdq
	BQUvCMD6nLYuTKVMVN5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnwaE-00GfSA-0G;
	Wed, 04 Oct 2023 07:46:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnwaC-00GfRQ-2L
	for linux-snps-arc@bombadil.infradead.org;
	Wed, 04 Oct 2023 07:46:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Subject:To:From:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=mMhfBvhM53FtUQl1P3lyeSY5aDBQYiR8qQBy6YFQHi0=; b=Y+dlniEHJr4TOKP3fu/JJavP6z
	m2qobloeriUyMmX1LMMnEYkkh/GPyGtmNXqI3JPZ1N7nYjoEcbX5jdLy6U+8AL656P0kmrMjJ/TR7
	DcnzoeU4xFB68FCQIERh2OWSf8nb6J5usGV0yeXnsDjskHt0WrCaF3CCEgJyNGpJOUOKnxn8q2TZ2
	P/E8D823S6Yxr20s0U4dCXJLwlIfD2r/Svma7/TTLmdzh58RQjtGgXxIvmM12WzBkUrTSOI2yx8kL
	i1xBhf4d0z54OHpLbYfuPvVU5TF47/SBdinmF87mjmip5jDWsKWOtioGMIuvN57GVUzAD2jodAw0N
	7AV0QX8A==;
Received: from mail.citycodes.pl ([158.255.215.195])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnwa5-00Aadh-2q
	for linux-snps-arc@lists.infradead.org;
	Wed, 04 Oct 2023 07:46:09 +0000
Received: by mail.citycodes.pl (Postfix, from userid 1001)
	id A39481F33E; Wed,  4 Oct 2023 09:45:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=citycodes.pl; s=mail;
	t=1696405566; bh=mMhfBvhM53FtUQl1P3lyeSY5aDBQYiR8qQBy6YFQHi0=;
	h=Date:From:To:Subject:From;
	b=cb5pC0JJkzW7QlKqFmCyiseWyP4Rz1NEpz+to7N8XBhziFI9F4vXPlkuaHKZi46aK
	 Hty0YTcFq+7L9SqNhq9Td7NtpYC6jg/1nTccomy/fHNDuPpRmUwj/VDagm0WBMJukV
	 FNyA8LpDV1GVcaEm3QqmJxCYfb9Hpcmx3yL/dAWpYuCOnuU9FwTH044dOda5wm1Vdp
	 +GzslHfYY+wnGevBK1TeFMQ+VCO/AFK6phgM74A/RUDYyYYVith02TNRku+3Vr8V0X
	 NGtLMW/BAsyN0QuWQdF3t5eE+sHKGMbS6e91lne+nIF3XmVSy89XDuSnV0ei/UEEFm
	 w3YBeaeV8H+lw==
Received: by mail.citycodes.pl for <linux-snps-arc@lists.infradead.org>; Wed,  4 Oct 2023 07:45:38 GMT
Message-ID: <20231004084500-0.1.7v.j15j.0.7n6h96n6gh@citycodes.pl>
Date: Wed,  4 Oct 2023 07:45:38 GMT
From: "Kamil Lasek" <kamil.lasek@citycodes.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: =?UTF-8?Q?Rozszerzenie_Programu_M=C3=B3j_Pr=C4=85d_5.0?=
X-Mailer: mail.citycodes.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_084607_584014_CAB14690 
X-CRM114-Status: UNSURE (   0.81  )
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

U3phbm93bmkgUGHFhHN0d28hCgpXIHJhbWFjaCBub3dlaiBlZHljamkgcHJvZ3JhbXUgTcOzaiBQ
csSFZCBtb2fEhSBvdHJ6eW1hxIcgUGHFhHN0d28gZG9maW5hbnNvd2FuaWUgbmEgemFrdXAgaSBt
b250YcW8IGZvdG93b2x0YWlraSBpL2x1YiBtYWdhenludSBlbmVyZ2lpLiBNYWtzeW1hbG5hIGt3
b3RhIGRvZmluYW5zb3dhbmlhIHd5bm9zaSA1OCB0eXMuIHrFgi4gCgpKYWtvIGZpcm1hIHd5c3Bl
Y2phbGl6b3dhbmEgdyB0eW0gemFrcmVzaWUgemFqbWllbXkgc2nEmSBQYcWEc3R3YSB3bmlvc2tp
ZW0gbyBkb2ZpbmFuc293YW5pZSBvcmF6IGluc3RhbGFjasSFIGkgc2Vyd2lzZW0gZG9wYXNvd2Fu
eWNoIGRvIFBhxYRzdHdhIGJ1ZHlua3UgcGFuZWxpIHPFgm9uZWN6bnljaC4KCkLEmWTEmSB3ZHpp
xJljem55IHphIGluZm9ybWFjasSZIGN6eSBzxIUgUGHFhHN0d28gemFpbnRlcmVzb3dhbmkuCgoK
UG96ZHJhd2lhbSwKS2FtaWwgTGFzZWsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFy
Y0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtc25wcy1hcmMK

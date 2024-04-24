Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B51FAC10F15
	for <linux-snps-arc@archiver.kernel.org>; Wed, 24 Apr 2024 08:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RbDjIhSgAInfJ2cTlRTVCWwKdr5X0s5fzLvfP489dGk=; b=3StgSJ9ExLi0aD
	7L3EGMzHrfa+K5LAA7Qu9HTDpi0+hRD//91MqtVnm63N+ryad/wdvIcfGntkU/t3fC2G0gtI9p238
	4Wn6G2jiT+JErV9H9LsNf35CV+lzdbw1nN0xgsefI5qcPXccy1GRvrL3wh0ZZpIvFct0phtX1p1KF
	otxsN7nwYoPg3Q1Loi02Hvq7CBoREbaGeccHmvkz2UvKqhjJKJsZRlXr4vzG7Y0ikhayyPTTIgEIQ
	b6lYbRBH6vX6Khxhu93fvmGPB3DPxtu3rUFyqYrZcc4O7l8Lg99Lp3e47mocC26EyyMcPZ90j+fY0
	ModpnyofqmdtK2xeAbgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzXph-00000003G6X-1GJc;
	Wed, 24 Apr 2024 08:18:25 +0000
Received: from mail.tradeharmony.pl ([5.196.29.197])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzXpe-00000003G4j-3SYE
	for linux-snps-arc@lists.infradead.org;
	Wed, 24 Apr 2024 08:18:24 +0000
Received: by mail.tradeharmony.pl (Postfix, from userid 1002)
	id BDF0E25628; Wed, 24 Apr 2024 10:15:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tradeharmony.pl;
	s=mail; t=1713946608;
	bh=niuXEqqR8RnV+jmqddfR0pqtgAFtRJIUEsYODsA2d0w=;
	h=Date:From:To:Subject:From;
	b=PpluuGCRXS+js/z6NMHnGuwFcyhoLP4Jop+kyeSF0W+7nDYzfwBh8Mvgt72BodoKM
	 I+d+b66N4+XacWhGwsI5i7K5kscKEGz1fkhxVPdS65f5il3dLyZzfz/1y4Uiij9hz+
	 NQvkxxAy5apVHNtFG4trg1dTsY4d13EVJEvGUJ+2o46H9GClpbQiPUfx+qp4I66vZC
	 iJnEeSagkZLZ1UPIT6yAFbyFGmEmdnWkDsLQPKVkipfwW3Dprn5q4tUmXjtHkIGMBp
	 tde/JWLuzlDF3Y7uGU3j2w41C8aXfpCvqClorEPFfCPaCH+sUEuYPYaiSnKdHeJR9u
	 qnZuHQlj5VkCg==
Received: by mail.tradeharmony.pl for <linux-snps-arc@lists.infradead.org>; Wed, 24 Apr 2024 08:15:25 GMT
Message-ID: <20240424084500-0.1.5w.28jzi.0.72arawl1t8@tradeharmony.pl>
Date: Wed, 24 Apr 2024 08:15:25 GMT
From: "Karol Michun" <karol.michun@tradeharmony.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: W sprawie samochodu 
X-Mailer: mail.tradeharmony.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_011823_060699_D948F511 
X-CRM114-Status: UNSURE (  -0.13  )
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

RHppZcWEIGRvYnJ5LAoKY2hjaWVsaWJ5xZtteSB6YXBld25pxIcgUGHFhHN0d3Uga29tcGxla3Nv
d2Ugcm96d2nEhXphbmlhLCBqZcWbbGkgY2hvZHppIG8gc3lzdGVtIG1vbml0b3Jpbmd1IEdQUy4K
ClByZWN5enlqbmUgbW9uaXRvcm93YW5pZSBwb2phemTDs3cgbmEgbWFwYWNoIGN5ZnJvd3ljaCwg
xZtsZWR6ZW5pZSBpY2ggcGFyYW1ldHLDs3cgZWtzcGxvYXRhY3lqbnljaCB3IGN6YXNpZSByemVj
enl3aXN0eW0gb3JheiBrb250cm9sYSBwYWxpd2EgdG8ga2x1Y3pvd2UgZnVua2Nqb25hbG5vxZtj
aSBuYXN6ZWdvIHN5c3RlbXUuIAoKT3JnYW5pem93YW5pZSBwcmFjeSBwcmFjb3duaWvDs3cgamVz
dCBkemnEmWtpIHRlbXUgcHJvc3RzemUgaSBiYXJkemllaiBlZmVrdHl3bmUsIGEgb3N6Y3rEmWRu
b8WbY2kgaSBvcHR5bWFsaXphY2phIHcgemFrcmVzaWUgcG9ub3N6b255Y2gga29zenTDs3csIG1h
asSFIGRsYSBrYcW8ZGVnbyBwcnplZHNpxJliaW9yY3kgb2dyb21uZSB6bmFjemVuaWUuCgpEb3Bh
c3VqZW15IG5hc3rEhSBvZmVydMSZIGRvIFBhxYRzdHdhIG9jemVraXdhxYQgaSBwb3RyemViIG9y
Z2FuaXphY2ppLiBDenkgbW9nbGliecWbbXkgcG9yb3ptYXdpYcSHIG8gbmFzemVqIHByb3Bvenlj
amk/IAoKClBvemRyYXdpYW0KS2Fyb2wgTWljaHVuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgt
c25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==

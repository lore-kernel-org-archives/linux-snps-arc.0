Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04E56C433F5
	for <linux-snps-arc@archiver.kernel.org>; Fri, 25 Feb 2022 08:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bkY8Z4mEzDCqBydaHVWDP8dRxexxl8gADjd7+n9Q+RQ=; b=a2kRSpuEtLKgt1
	bjrDFilmhqpNTFzbqHhw/HFPATeI+pfdJVIj6pNFIHaDxW4Aq9XOnUkBG/CkowcXn2jDCJz8LgUHX
	uK7s3Yt8e2MRp2i0WkLyAaO6Wusiiax8/pIVM6YT7nscT7tHcg7ubJDwogbJuJ/Ph5qT2PTEeNRCB
	Q7TqgFO2V4PMSEpFmTA2iEiWFco5AsoabWsRg+dY0z3Ymgabu0cESjTvrM+WpNof0qLQVGN8vGutE
	tXT0o9nsmAs726/Cj/8fSUzcXQiBJ16a2id0rcAbWSPmXpBZvFXKFHqYPpeSWAq0i8h/xhzDsZIRw
	6ZhxwpAHGGwfeHVBjO+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNVj4-003sI1-6c; Fri, 25 Feb 2022 08:13:18 +0000
Received: from mail.powerangels.com.pl ([45.86.209.159])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNVQW-003iwO-CI
 for linux-snps-arc@lists.infradead.org; Fri, 25 Feb 2022 07:54:09 +0000
Received: by mail.powerangels.com.pl (Postfix, from userid 1001)
 id 382E4833CA; Fri, 25 Feb 2022 02:45:42 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=powerangels.com.pl;
 s=mail; t=1645775209;
 bh=07NAgW1e0WiNB9zqagiM2BnwZfWBCpNa2E4+ccxBPgw=;
 h=Date:From:To:Subject:From;
 b=TEoD09sswnrX9CR573gmwYHEXtfb50aAwf7oOMKd6to1z04mlTTXWW7hOuhWT/PdZ
 YJnAbt64OPWVZWVZDVk3c87lZQ3XUqW2/bAp4Qe56hwiTsKMCgECn1kvmYXQ8vWwlp
 /Nsz987rZaf5rriizYstC8EpyBbqDV861bwttvZx2BjKk3WreoUbd3PSQYNBCZVV70
 7Kj9lKuvkO8AsEuMsn0/rPmCMKKhFy+AA96qPFS/6OBUT3pPn68Z2yOuD/G83qMn/w
 6iN9yadvHdLrGNqnfHj+FKtEGTvmfgKVAHzw+GI8xOAZFfzLFlKEDenxtJwRMzvpsW
 6Fz4/JzZ+DG2g==
Received: by mail.powerangels.com.pl for <linux-snps-arc@lists.infradead.org>;
 Fri, 25 Feb 2022 07:45:40 GMT
Message-ID: <20220225024500-0.1.j.2192.0.6zfilhijqj@powerangels.com.pl>
Date: Fri, 25 Feb 2022 07:45:40 GMT
From: "Jakub Daroch" <jakub.daroch@powerangels.com.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: Wycena paneli fotowoltaicznych
X-Mailer: mail.powerangels.com.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_235408_483060_E080C075 
X-CRM114-Status: UNSURE (   0.95  )
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

RHppZcWEIGRvYnJ5LAoKZG9zdHJ6ZWdhbSBtb8W8bGl3b8WbxIcgd3Nww7PFgnByYWN5IHogUGHF
hHN0d2EgZmlybcSFLgoKxZp3aWFkY3p5bXkga29tcGxla3Nvd8SFIG9ic8WCdWfEmSBpbndlc3R5
Y2ppIHcgZm90b3dvbHRhaWvEmSwga3TDs3JhIG9ibmnFvGEga29zenR5IGVuZXJnaWkgZWxla3Ry
eWN6bmVqIG5hd2V0IG8gOTAlLgoKQ3p5IHPEhSBQYcWEc3R3byB6YWludGVyZXNvd2FuaSB3ZXJ5
ZmlrYWNqxIUgd3N0xJlwbnljaCBwcm9wb3p5Y2ppPwoKClBvemRyYXdpYW0sCkpha3ViIERhcm9j
aAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
c25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFy
Ywo=

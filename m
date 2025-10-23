Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A8DCCD193
	for <linux-snps-arc@archiver.kernel.org>; Thu, 23 Oct 2025 08:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=P3+vNSYNieI2aKT4Yc7/dhCBEz0PmyVo2CMtaNtjmrY=; b=hFHB/1vyYSW+WY
	ZhkFoG972cydnpCxBhtSdTflgxRG+1O0/kuBZ3kxZ3B/wnuZrrSXeNtJ/3IUp2jpmgNGTb6+BvbME
	Z1uOkze6Ik2Dmcn2Y7ozMNWFoctaAPdUZiHHN/RsUkFPfLa/fiaK7aom9E7YPd/inz+09YFaogxqG
	/vpWkikROt8+23tJ19ASoHQOMFCD5UuxOUGBvTPP71UYTP42AOFljsqoFIhDet3sDvQjCvXN9y7tD
	/f9jtQ95FSpXinkj9POEbAC8TYDGoubImDGL+cSKWeSpSYOXrMWFUhYLWLocXOlpHjYAVkuIhIcO1
	X4DwXZyCHwPtLR1e6A1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBqXA-00000005Vn7-29DT;
	Thu, 23 Oct 2025 08:18:56 +0000
Received: from mail.scalenook.pl ([51.91.253.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBqX7-00000005VmP-0Ec2
	for linux-snps-arc@lists.infradead.org;
	Thu, 23 Oct 2025 08:18:54 +0000
Received: by mail.scalenook.pl (Postfix, from userid 1002)
	id 1473227E05; Thu, 23 Oct 2025 08:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=scalenook.pl; s=mail;
	t=1761206909; bh=qsFkU/uX4KHJ4f1uzm2iz39kAHCe9u2uFgt0PtntkBE=;
	h=Date:From:To:Subject:From;
	b=bgGg/RvKGYF7U0K0mEkwpUGMa2bsybfM321XG766fiyMLBlmey44LgZEaif83tbp0
	 7JVOKlwpyzNGDrmrMUi6wLu7RNLMQpDlQZ/cHG1u9k6Wd5O+I5QT0JmGgllyjXl/ms
	 xr5QKC0NaXGKdMR8iXoY2pt07UC0oRiCpPTS3IMFoztNYcAnq6AtwCtLKnXgw6IWN+
	 m3jBrTJ/3Z1FgSeiyIQmshG8aZK7muyQaq3PcENFovrr9FfA+aQEC5dqXbcHKo07Js
	 gKu+Eq9WLVZ9M1AElyiIgMjDmZAEGGBWGmcNI8gdlUiroVMZZZKaS3rk66gbsLaoVL
	 WbvCq5RsUc3Hg==
Received: by mail.scalenook.pl for <linux-snps-arc@lists.infradead.org>; Thu, 23 Oct 2025 08:05:43 GMT
Message-ID: <20251023064501-0.1.v.ghpd.0.7qma302jjc@scalenook.pl>
Date: Thu, 23 Oct 2025 08:05:43 GMT
From: "Ewelina Koprowska" <ewelina.koprowska@scalenook.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: Karta lunchowa
X-Mailer: mail.scalenook.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_011853_378463_057E3DBC 
X-CRM114-Status: UNSURE (   0.18  )
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

U3phbm93bmkgUGHFhHN0d28sCgpjenkgemFzdGFuYXdpYWxpIHNpxJkgUGHFhHN0d28sIGphayB6
d2nEmWtzennEhyB6YWRvd29sZW5pZSBwcmFjb3duaWvDs3cgaSBqZWRub2N6ZcWbbmllIHphb3N6
Y3rEmWR6acSHIG5hIGtvc3p0YWNoIHphdHJ1ZG5pZW5pYT8gCgpPYmVjbmllIGplc3QgbW/FvGxp
d2/Fm8SHIHp3b2xuaWVuaWEgeiBvcMWCYXQgWlVTIGHFvCBkbyA0NTAgesWCIG1pZXNpxJljem5p
ZSBuYSBrYcW8ZGVnbyBwcmFjb3duaWthIHBvcHJ6ZXogZG9maW5hbnNvd2FuaWUgcG9zacWCa8Oz
dy4gCgpaYSBwb21vY8SFIGthcnR5IGx1bmNoIHByYWNvd25pY3kgbW9nxIUgcMWCYWNpxIcgdyBy
ZXN0YXVyYWNqYWNoLCB6YW1hd2lhxIcgamVkemVuaWUgb25saW5lLCBrb3J6eXN0YcSHIHogY2F0
ZXJpbmd1IGN6eSByb2JpxIcgemFrdXB5IHNwb8W8eXdjemUuIFRvIGRvc2tvbmHFgmUgbmFyesSZ
ZHppZSBtb3R5d2FjeWpuZSwga3TDs3JlIHRha8W8ZSB3eXLDs8W8bmlhIGZpcm3EmSBuYSByeW5r
dSBwcmFjeS4KCkNoxJl0bmllIG9wb3dpZW0gd2nEmWNlaiBuYSB0ZW4gdGVtYXQsIGN6eSBtb2ds
aWJ5xZtteSBwb3Jvem1hd2lhxIcgdyBuYWpibGnFvHN6eW0gY3phc2llPwoKClBvemRyYXdpYW0K
RXdlbGluYSBLb3Byb3dza2EKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtc25wcy1hcmMK

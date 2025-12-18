Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDA9CD68BF4
	for <linux-snps-arc@archiver.kernel.org>; Thu, 18 Dec 2025 08:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=m3PreUhMXNa6TMJ9VQAtx6xrAw6zGemCeFpX+tXdEHc=; b=PSSxxzuokp1tiG
	GQdMUa7fAysQNgXMBafyK5tV1buUvFwnO/YbRfatUQVOx1zquRgA0CDFvIibR3zd0aC27MgCZ5eq5
	BxgJgkQxFeM1Z4tkIi2IqxEUs9hepYB/Do6CXPPXgLXHppofwlKld4mUEJXSQEQdMWAuf5XJVOiAx
	2YEHZk/YUni8hv6OuTVuVo6YnwsU+ld4HCYG5ge/gG/bjzOhGnCH+6NDcQFI8JaREqy4nim3GMqzl
	XomVfUU1n0ojRmHFVwqzmFNxRzmYAgfoNly5I0S5iRO/Tih5k5aLrhBdilfh5a03w+Ub3ZEjm/hL2
	ES9mZwxTgUTZQggwM2Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW9f5-000000085cJ-1XNV;
	Thu, 18 Dec 2025 08:47:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW9f4-000000085bu-0yuz
	for linux-snps-arc@bombadil.infradead.org;
	Thu, 18 Dec 2025 08:47:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Subject:To:From:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=g+bJVIpt0gfvrKpvvpbdhzaZrLDQ51BQvCd8rNT5zDA=; b=M/2R0NeHXMjux4Vs0Z+/lEkpAC
	/YW9uYk/IhBLigNQxW5qu9wi3Qt2dHWzgUJgJOormhhV4+Uf4BoDsJX3b4qTt2y8/zJl0+UMZBVtx
	zoa96JUXjPxGHXBIuIEzJc4QoXEvkurR/BS/qaHX6oCg7Za5Its0EucwxiKRpyljISVbryQ/gHULc
	SUz2D2cy/zqx/T6wC9apgCyZhUKDkLYXZj8tOnk744zDJssTVrUBFqlBtbxDz+a8YfAkyDKUCgwHK
	mnYVPrpb4mKTcF8PB72EyHpUZWRJDulJO3JG2oLwU/hjF/Uar7AvTUeJHCBToawrswKkx5TiISQls
	doX2o0wA==;
Received: from mail.torqly.pl ([51.38.112.117])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW8nX-00000008O3t-0SB8
	for linux-snps-arc@lists.infradead.org;
	Thu, 18 Dec 2025 07:51:46 +0000
Received: by mail.torqly.pl (Postfix, from userid 1002)
	id 4833BAAB1F; Thu, 18 Dec 2025 09:46:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=torqly.pl; s=mail;
	t=1766047612; bh=g+bJVIpt0gfvrKpvvpbdhzaZrLDQ51BQvCd8rNT5zDA=;
	h=Date:From:To:Subject:From;
	b=usDCFcWdaKSnuX/Pu0COYYhQjQar6F9HpIIu96CdR9P0rkytBnV/7yqaeLvlpa+V8
	 U9CyknzqBwdN8IjAn4biwNxV/kOIRW40Uj1wcLXp26uMkA6jdeNoMaDyoAvnubRP7+
	 NyXZYTgsvrZerltKQPwu/dsnsQyRCEcmkAEEPrAQV23D2cvtGLpnd7NEQOD/VwsdUa
	 ZyM/nrFdhmZWcHnRTOkBtiq7uFk43/HtvJ7X/qbCc/QnpkaRBJ/D25989c2Zvles1g
	 g+yAv2iVgDrRfCeQr4cGDm7KtdjkFMEwWCT/WdYfG+sOzw0K+ThcE5gypMSbd9A0C1
	 6HkXz8T+Ao7Hg==
Received: by mail.torqly.pl for <linux-snps-arc@lists.infradead.org>; Thu, 18 Dec 2025 08:46:01 GMT
Message-ID: <20251218084500-0.1.tu.d9iy5.0.vbqqqy017v@torqly.pl>
Date: Thu, 18 Dec 2025 08:46:01 GMT
From: "Tomasz Jaworski" <tomasz.jaworski@torqly.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: =?UTF-8?Q?Ulga_na_sk=C5=82adki_ZUS?=
X-Mailer: mail.torqly.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_075144_689426_35A05189 
X-CRM114-Status: UNSURE (   0.73  )
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

RHppZcWEIGRvYnJ5LCAKCmNoY2lhxYJieW0gd3NrYXphxIcgUGHFhHN0d3UgbW/FvGxpd2/Fm8SH
IHphcnrEhWR6YW5pYSBiZW5lZml0YW1pIHcgxYJhdHd5IHNwb3PDs2IsIHBvcHJ6ZXogbmFzemUg
aW50dWljeWpuZSBuYXJ6xJlkemllLCBqYWtpbSBqZXN0IGthcnRhIGx1bmNob3dhLiAKCk5hc3pl
IGthcnR5IG9mZXJ1asSFIHd5Z29kxJksIG9zemN6xJlkbm/Fm2NpIGkgemRyb3dlIHd5Ym9yeSDF
vHl3aWVuaW93ZS4gRG9maW5hbnNvd2FuaWUgcG9zacWCa8OzdyBqZXN0IGtvcnp5c3RuZSBkbGEg
b2J1IHN0cm9uLiBLYXJ0eSBsdW5jaCB0byBkbGEgcHJhY29kYXdjeSByZWFsbmUgb3N6Y3rEmWRu
b8WbY2kgdyBwb3N0YWNpIHp3b2xuaWVuaWEgeiBaVVMgZG8gNDUwIHrFgiBtaWVzacSZY3puaWUg
bmEgcHJhY293bmlrYS4gCgpLYXJ0xJkgbW/FvG5hIGRvxYJhZG93YcSHIGRvd29sbsSFIGt3b3TE
hSwgYSBuaWV3eWtvcnp5c3RhbmUgxZtyb2RraSBuaWUgcHJ6ZXBhZGFqxIUsIGxlY3ogcHJ6ZWNo
b2R6xIUgbmEga29sZWpueSBtaWVzacSFYy4gCgpNb2fEmSBwcnplZHN0YXdpxIcgb2ZlcnTEmSwg
a3TDs3JhIHBvendvbGkgem9wdHltYWxpem93YcSHIGtvc3p0eSBpIHphcGV3bmnEhyBwcmFjb3du
aWtvbSBwb8W8xIVkYW55IGJlbmVmaXQ/CgoKUG96ZHJhd2lhbQpUb21hc3ogSmF3b3Jza2kKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMt
YXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK

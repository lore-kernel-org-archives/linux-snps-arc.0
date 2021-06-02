Return-Path: <SRS0=Frhj=K4=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,PDS_BAD_THREAD_QP_64,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2172DC47083
	for <linux-snps-arc@archiver.kernel.org>; Wed,  2 Jun 2021 17:36:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C923561D71
	for <linux-snps-arc@archiver.kernel.org>; Wed,  2 Jun 2021 17:36:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C923561D71
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xfESb14+CcbBLfgTkutqh+eMFjNycudmboKf8NqA+k8=; b=3uZHuUNPuRZCsR
	coyNo5Npzl9OInlDr7jBMf/hAsK3dURcnJpR7rWK8X5olA2d9VWk3k7uuRxQAN9dbtSZMxQFR9WN7
	8S/uF2VfF9OXjBKIP73QMt6CLPl66IEfJUEbklUtmuJj1RcOE6rhF2Y8FXM039ZEHCBEU50ywwTmT
	bmYtlPcPLdpuZhLwNLfIpc32AhFzsd1/GrY2nq/S9vgVYLFL/AjW8tsEdCHhNwTZidToYJC8kNjS7
	HwoOXIRi7YZc44JzPS+gX8UDNbr/xlnYqFnjvT48BfcZEz8fSU8c0oSOjarRoNqwAN86gEHrBhCHw
	FnSkU0siPt60encRHpug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loUms-005b4M-1v; Wed, 02 Jun 2021 17:36:14 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loUmo-005b3P-OY
 for linux-snps-arc@lists.infradead.org; Wed, 02 Jun 2021 17:36:12 +0000
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id DD1A3C0096;
 Wed,  2 Jun 2021 17:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1622655369; bh=0MgrAfa1I/GHElcZcAX/ya50xAWgPECnyp4nElH2p/0=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=Kgz6Qoz3dSFRYb9qK7szZv63pDxVtxujTlYsOpcRxZoNRTGS91T/cAQV6TiVJQ1S9
 sH6SdffJWbaGsw+hgoJtHl2ZL3SjdDCnnxFw/+OV97iLu19NZ/47eJSPkA4Lgy8boo
 9Ud15ilCQ5TNIS4l24CPTMk2WRit0PaGIrQCpsvToTgrPuXRjsTxZZpNpGNids0wvc
 zjbx43CE3rWnUp9iiJq/NQQ6CMix5+Jx7Qq/9eT8NJj26VzQzjbxW1pvWMyovs+LmZ
 TtUidahbuG5Mhh+4pBZlds6w7olg1hZf80xy/0SttTBqllYjEFRRi3oV4PHlFciDoI
 537x4qgskrrcA==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com
 [10.4.161.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id E38A0A0077;
 Wed,  2 Jun 2021 17:36:07 +0000 (UTC)
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2045.outbound.protection.outlook.com [104.47.73.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id EB0648026B;
 Wed,  2 Jun 2021 17:36:06 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="bV8vuuJo";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m4Yu5fyFyGboLjSSJwSid5CIVfs0ZveYJ2zFpjRfJDXJqSHOfQrgH95VNKSmlrSOYhp50UCMAnKPaJYxJuqgieEfmE1MFhTHCNLD3AXeGrBaWxJ9aErenU+OnJsIF4MlFNWvH+f1Tza2SENTJ+tt3qURsZxqeeqqYDRvMMv0I9l/AEpwfDpsQ+RNN5AlqIDAg4YE2Q0f93IHwfkAkj0XLzccdXjhd+1EMaDXxBO9+ZbZbipqqCWl+LZNn0qhovDgm/zgk6ItMV4ipsh1d56+VXp5mNCi0vlBL+TtLkBTwI/5yaGCsXBYqHI051Ex1YUapzmMs2XsSplZURywbwt3Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0MgrAfa1I/GHElcZcAX/ya50xAWgPECnyp4nElH2p/0=;
 b=BPHeVnEphz121tBzshsuHoq1IvGAfqDYo3dsbZYkLz4gDMuIqyOC0m8gkH6aFM1xSqFnJMP+w3JD13JNqFUFZQCdgRtY3LuKyqvCG8yfXEP+rh5kk2diDCCHhonFeOeq/q2bOpDSr1s4G/wDtV3OfF59yu10WoWCGrnHgAXUhXWGLjy2kYEQqVj7zYRjPvL2gGcBnX9g9jo7TTSrCJBhFnBPl/gD9GXxdBjDP+pnVxXe4r+G03xFeXu8ZGcW9eHl4vzDoFFi8E0n6S81ZkLQZWeqcShFaqgRnMcXvlJFRri3GdaWaEr/Mjbm9Rz+0xIgFP3yxZj4Wy8M4jgEdvEtxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0MgrAfa1I/GHElcZcAX/ya50xAWgPECnyp4nElH2p/0=;
 b=bV8vuuJo0m9shNHKFPNS4lVzfUd8UHZfN2P3dzvlqfMl4GKcSD99sz+Ci7e2j1DTEDBY0ekzuiVG1L+JfkJmIsZPG4v7zWPP+pMozDr1g8fyite36eLNXNvqP39ghJrCc/dQewxQMpF+oFf2QSISItXpFE1qWUqhyVx42gYnne4=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BY5PR12MB4097.namprd12.prod.outlook.com (2603:10b6:a03:213::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24; Wed, 2 Jun
 2021 17:36:03 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::d1a0:ed05:b9cc:e94d]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::d1a0:ed05:b9cc:e94d%7]) with mapi id 15.20.4173.033; Wed, 2 Jun 2021
 17:36:03 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Claudiu Zissulescu <Claudiu.Zissulescu@synopsys.com>,
 "gcc-patches@gcc.gnu.org" <gcc-patches@gcc.gnu.org>
CC: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Subject: Re: [PATCH] ARC: gcc driver default to hs38_linux
Thread-Topic: [PATCH] ARC: gcc driver default to hs38_linux
Thread-Index: AQHXVx5YF7mQ/EeuLEqPKCFoEbWDrqsAZygAgACWHgA=
Date: Wed, 2 Jun 2021 17:36:03 +0000
Message-ID: <7cbcf71f-1b24-c1b1-ab7b-e2a3144ff675@synopsys.com>
References: <20210601194248.135515-1-vgupta@synopsys.com>
 <MW2PR12MB2346EF898A0906148A27B836CA3D9@MW2PR12MB2346.namprd12.prod.outlook.com>
In-Reply-To: <MW2PR12MB2346EF898A0906148A27B836CA3D9@MW2PR12MB2346.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
authentication-results: synopsys.com; dkim=none (message not signed)
 header.d=none;synopsys.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [149.117.75.13]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cb5e5b81-f67f-4985-fc31-08d925ece539
x-ms-traffictypediagnostic: BY5PR12MB4097:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB40975B9EF8E1627CF9133ADAB63D9@BY5PR12MB4097.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SxwearxV+qhpYeFrHnYjJwgO7h/akEvuzd38qrmQqvoMy2LGkxjpHQzWTpiD+xvKtPbkrw9q0eq3VoA3o2rXPfA6PIihFRdS3rFQ+QRuGgw6eP/QUxMjGw7aYAw89ybVXsQdcKGQfVJ4dpRzg7zwI3cIqNmSII+ux7hduPdv/dTFCxdKku/sXPVTiF7OA7p/UwU29BprMFtQFhO8Jsw1mY2GF0k+Qbboh7cf2hM+JunqoPbKrsJQGY01eyBR86a14TN2Ql9fY0PxFkAJLRM0iwzKIWZfNWclDZTts4c4tpkzVxhN5FnMnOf1AOuHDOrZt01yobQS/dM0Y8A8es3o+SZGRufNgZKnGHCHn21KqXR5bFI5QWmq1WGO+niOu8oq60cpbHb2cN8cx52/a8ul5M25J/ea3esFXBHEudmaxtmD9VtVT5MezceBxd1f2Ijxwbqoukg89Wtt/tOtMB6sDwZ6ZaBlCZX40eJdycrGeTXkdjB+sinXi4hCFYBSEeA/hKs8gm4ZaSqHrrfwnancbsqtKJQk5AICRZCTXweGnC6hEV718Yb72NnR5Cz6vATJNJUz7j+do2PYQWmM9njRQOGoSfW3Hh2BdNnh4ILTuKUVy5oBtALmy22/bhuV55rvqo86/BXmK3upIIj1UUSljSnSj7mm4jnYIjJv7zfo+qZnXUSrIo6YlQBLDNqvOaXK
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(4326008)(31696002)(83380400001)(26005)(6506007)(8936002)(6486002)(71200400001)(36756003)(66946007)(66556008)(53546011)(110136005)(2906002)(2616005)(64756008)(6512007)(76116006)(122000001)(31686004)(38100700002)(66446008)(5660300002)(186003)(86362001)(8676002)(498600001)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?Windows-1252?Q?AatFkulGYPmS3p1N7xekmB/qzpH2HMUsbkMAA+fnYRSlmiFAe0yV8GQ9?=
 =?Windows-1252?Q?bRhzBESBgZppUiilYMyj+g9oj3OGAaSAmqsYXRVhgtC23cAEJmaZnNTX?=
 =?Windows-1252?Q?FGExjhnm/NXBzsfHnuDhXUnzMxaJKoMoKm6C4JpGS4FIr9B9/s2lV/rG?=
 =?Windows-1252?Q?ZmWEUVdtbypOP+3YnRirTvORJ5vFNlo4FlGpW2VR6wlDzrarId/0VA9+?=
 =?Windows-1252?Q?9ojR0/qfCyQAssFr90KpvvarVHUe8MXxpQENk/Y1bVeb3XtDPrFiJUmS?=
 =?Windows-1252?Q?EWMqkF1zjBZlT8NO2aw2/XIfrehXoZpCw7eNbRHyhJncFizZFsSdWJhP?=
 =?Windows-1252?Q?BqaaqCttshkQgXseSbxi7/GBzQr4N0oig+G2K7wgXHa4xfdxZMZM2qLa?=
 =?Windows-1252?Q?Lot1V0zjsNmMjjvaUr7TRLpS508xXP4GESPQhc36ZNh/Cf0dKT3hg/ri?=
 =?Windows-1252?Q?5+rwz3DCdb9MVLszaUBu+bavpUM00+o6cl+lycJBoewzjyHvkMjJnQb8?=
 =?Windows-1252?Q?inSje+5Wh70+LuEsrv0onGjOLv0mFj6UEQksNPmaQU3FNkS/jT7DiJYz?=
 =?Windows-1252?Q?j5ZUclpbtJ/IanW6/0nVa5oyy0X4DB+Ymfn532rhS8qrW6I9EQu3Fc/l?=
 =?Windows-1252?Q?wvUWQBuXPmAHTha8ogX4/gSz7MG1uhf/pwk1JoC7MskOF3IADiGTA8bJ?=
 =?Windows-1252?Q?PXOWdMxTIPSuddlWz7IJwaDQxhDSvTxDcork0zB9TA6Wl/cph8MDxu22?=
 =?Windows-1252?Q?u/RwKCNde1aggNLctAdrWhIYSPRu1kODoUlSKbas9sIsr6kV0JBNtS90?=
 =?Windows-1252?Q?Q7xHo2ECOG9R3FoXfEKCQSrRvPQA3UUNeByFoBcVveXWgJ/PrzCzBhBZ?=
 =?Windows-1252?Q?TMiJg3AeaRJ6QC4/lPNL0IE21YKxOvxabwMlpSMgssh4KhjNlZ5wWeGk?=
 =?Windows-1252?Q?h/BN3TUWDaCNvYzZ1D7ZIG0cMLlLJu2Z/aomzkWGA5vfq4zSU6q2BeSG?=
 =?Windows-1252?Q?pVqCI95TPqIyLJbVLqIo0lhU7Iu14WU2NKAC2WkUBqt8pBafunTheThm?=
 =?Windows-1252?Q?xNB5Be5uxcBXIjq9TWG60lXc+/GxcmqTRBln0Czi9xfcHOgGW5q82VXP?=
 =?Windows-1252?Q?srgVw6iaygUsGb2m8nLz+5eZ7epPy77dNnHddzAsJI8t2e/JLO51c7MY?=
 =?Windows-1252?Q?mGfZgXtYJROXwFjKAo9JlcwIODBusay+3O6OL8dRUbPcS+gXuF6Z1lTj?=
 =?Windows-1252?Q?VAvukIRelyYUr1G5qOARoe8KAIEJLLMUEveqU5lJbINt1t5lCMg8mFH7?=
 =?Windows-1252?Q?+kVTM3HLPCqSpXkflJGmncaWHzxLCJvrCWaBdpDi7imJ3nmnX8iCHq+6?=
 =?Windows-1252?Q?OcsqXDEYSI+cFGBhEW4P243CR+sTfZiSuH4=3D?=
Content-ID: <8DDF1C70FD2BF14CA88F7616C7DE43B7@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb5e5b81-f67f-4985-fc31-08d925ece539
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2021 17:36:03.5719 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Vl/R7mhuW9xtdfk8DXJp8vJHCqxHVG5oXLXTxVrwWIr/64elDZ4kKnIT+s+uVZ9k2ynhj2vflS5xI1VzBzgDSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210602_103610_893749_03BBDF57 
X-CRM114-Status: GOOD (  18.57  )
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
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 6/2/21 1:38 AM, Claudiu Zissulescu wrote:
> Approved.

Thx for the super quick action on this Claudiu. Can this be slated for =

backports too as it causes issues when building toolchains for modern =

cores without explicit defaults.

-Vineet

>
> //Claudiu
> ------------------------------------------------------------------------
> *From:* Vineet Gupta <vgupta@synopsys.com>
> *Sent:* Tuesday, June 1, 2021 10:42 PM
> *To:* gcc-patches@gcc.gnu.org <gcc-patches@gcc.gnu.org>
> *Cc:* Claudiu Zissulescu <claziss@synopsys.com>; =

> linux-snps-arc@lists.infradead.org =

> <linux-snps-arc@lists.infradead.org>; Vineet Gupta <vgupta@synopsys.com>
> *Subject:* [PATCH] ARC: gcc driver default to hs38_linux
> arc700 is legacy and there's no active development for it, so switch to
> latest hs38_linux as default
>
> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
> ---
> =A0gcc/config/arc/arc.h | 2 +-
> =A01 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/gcc/config/arc/arc.h b/gcc/config/arc/arc.h
> index bd1fe0abd7af..252241a858c9 100644
> --- a/gcc/config/arc/arc.h
> +++ b/gcc/config/arc/arc.h
> @@ -34,7 +34,7 @@ along with GCC; see the file COPYING3. If not see
> =A0#define SYMBOL_FLAG_CMEM=A0=A0=A0=A0=A0=A0=A0 (SYMBOL_FLAG_MACH_DEP <<=
 3)
>
> =A0#ifndef TARGET_CPU_DEFAULT
> -#define TARGET_CPU_DEFAULT=A0=A0=A0=A0 PROCESSOR_arc700
> +#define TARGET_CPU_DEFAULT=A0=A0=A0=A0 PROCESSOR_hs38_linux
> =A0#endif
>
> =A0/* Check if this symbol has a long_call attribute in its declaration */
> -- =

> 2.25.1
>


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

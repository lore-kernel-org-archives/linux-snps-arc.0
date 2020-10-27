Return-Path: <SRS0=oLQF=EC=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB7FBC4363A
	for <linux-snps-arc@archiver.kernel.org>; Tue, 27 Oct 2020 01:45:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA8162085B
	for <linux-snps-arc@archiver.kernel.org>; Tue, 27 Oct 2020 01:45:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Kvk3Ss57";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="RgpV+ff1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="gbACpv2k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA8162085B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JZqi/EPanSWMnmoCwOQ3hTDQxEOQ1jN1ANPO3IJRoqk=; b=Kvk3Ss5749Ag1AFbqBDraEcDj
	Jtih8rFmo3uZXn2XcP5WKYs4YN4JeG3hVXy3/FXxkCr0nmCcUISMYGO7eHK1y+BekDgYJODSJU9NN
	NA2NsML02sEfDctYPxEpOjSjlHG6UL9r72lMiJlCPUdHtPyzDLUH43cbPj2cZRaGeGcCy0bnNsun1
	r4KRp/lNWNMcui9PHceC78IRgwJctJLJ8meYpA7WCXiHExgsgdakZ+JVHMSSGUWRb7cCraYlNwoDF
	sTEXUtdQ+nhfSX+LRTJ2/sOFfJUnhsEjYW577ryWJ3/KkEiKeAVNwnhDY5dAPTdEnd7Xb+lESRZ4u
	db+ZVSVzw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXE3b-0002kT-Rq; Tue, 27 Oct 2020 01:45:51 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXE3Z-0002jX-BP
 for linux-snps-arc@lists.infradead.org; Tue, 27 Oct 2020 01:45:50 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id BAC96400BF;
 Tue, 27 Oct 2020 01:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1603763147; bh=GNoMBtyhkPRDN5QEfc16qmxVVCWzjaaxtdmxzYbgKiU=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=RgpV+ff1jOUZDrBwNYCI8j5k22z77a3PZIYEvNuDjzYyNaRPUkEs3xPq8IPwYexI7
 gpk9Nu3fZ0NxEvfYYmfdOOTtRotbPV62XpXS8T/wnU/BvFO7dWYWMumw6wVu9/PFdj
 0cZ+hKma/fEPE0BqQFWPUwjO/LNWWwGhFclUvDCYuWcQeBS7RhpBcrphrCwEqwWlxa
 2Auw/zD5M/JVszdNNsduV1EvG+TpFj4/Z4cpbtgxVtimUtzeCg7lpksLU8XP55v4pV
 Dit//y+4VPJQ3u2z1GKoMH010J5Rk3pemL3fOg1CZ9eFA9qsZ1d023SJehb4q7SacO
 grRlDnxpRU4qg==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com
 [10.4.161.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 21151A0071;
 Tue, 27 Oct 2020 01:45:44 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 4EA19800C9;
 Tue, 27 Oct 2020 01:45:40 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="gbACpv2k";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UFbCshXt7edBVEN8zbDHr+9EktfDpn0H0rxiQ2n+/HElQIropPl3Fy8BPUc+QfR/2AdU7yUUGNjN5Y5w5OEfZQtH0PFR8jowPNVMy3yoQV06IBXFzPEwbJijQbHuq5LzAo+CRY/GV3aCFEtaniJ+1ZAbbUDjyYPRCie/aQp2vtAo4BCIyhL9q54me1oLdb4kdZlfaj5t5n1NadRAtGGoPgRTbq9lDKXDsrjHVBSfNlVthegMbOiu3+KCQctIQwvvudo7jYbLHQjI3hSrrYYIhdKn1TXS1ojS+j58UgYy1+3vk51QUOGMdSt8HnXqwskb5snqQq1Jp6TYCcw/CzW/mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GNoMBtyhkPRDN5QEfc16qmxVVCWzjaaxtdmxzYbgKiU=;
 b=E2fDKab5CQsoXeoFxYF36lt1/502+HAa1mpg+eppNo9Vt9W1gdDR30RFrZ9w/JhRv/wd9zjzwHxWAfsrLuLdHQLrfrc1/MOHETg71hmgMSM8gRM+XC2aa4Rq1p09AdoiuwWP2fY38vdHJ0mrsk6n1PUTP6QrbRcfmMVPI++f5y9nfe4MjwLyQWoNGTiozB4McGC9X+kzJrCjLwwYaYDIAoTdssc/USWJ/1irVE85VWQfINatnfRZsahqTEQKiv+3JWjbmsonaVWp/4gkfhDoJd6LC1LQG86NC1F+Gro3V2frU06Et5WWeAX+YD1MDVMjj7J+3cPuu4qYcJlJ/VIiOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GNoMBtyhkPRDN5QEfc16qmxVVCWzjaaxtdmxzYbgKiU=;
 b=gbACpv2kAwFhMJ7TSIk7Bk4+JP2mb+eoBvfGGw70zMNrWjE/kauvqVCU+uRzUrpmA/z/5Lesm087Ob2TwyEs0Bf3o0DdxIRcGOuZiE+nXB7A2b+aSUULfDAbBq5UZ1+YeDXsZ7SjaeQTT+vUtrDfhIpj9tmY86PFplYzlsfje5Y=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BY5PR12MB4258.namprd12.prod.outlook.com (2603:10b6:a03:20d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Tue, 27 Oct
 2020 01:45:39 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::c562:e026:68d6:cd31]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::c562:e026:68d6:cd31%6]) with mapi id 15.20.3477.029; Tue, 27 Oct 2020
 01:45:39 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Claudiu Zissulescu <Claudiu.Zissulescu@synopsys.com>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: Re: Build regressions/improvements in v5.10-rc1
Thread-Topic: Build regressions/improvements in v5.10-rc1
Thread-Index: AQHWq31I6sUC2w0KikO4S+PwHkx5uamqrsIA
Date: Tue, 27 Oct 2020 01:45:38 +0000
Message-ID: <c235619b-d4be-e064-c74a-ea67a5d70bcd@synopsys.com>
References: <20201026081811.3934205-1-geert@linux-m68k.org>
 <CAMuHMdXbsJPnsXg6bA_e32zJkBG1Zzqj-ja5WzHDKL0d9OcfPg@mail.gmail.com>
In-Reply-To: <CAMuHMdXbsJPnsXg6bA_e32zJkBG1Zzqj-ja5WzHDKL0d9OcfPg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [24.4.73.83]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e392331c-acb9-4d6a-6411-08d87a1a01cf
x-ms-traffictypediagnostic: BY5PR12MB4258:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB42586001C068C3558279A160B6160@BY5PR12MB4258.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:201;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: krVuI8Yf8XvDFdxNeINHB/A0YwD8VksK1B04aGEpajWlCN3zWlXJlzTDinpnVImtbT7rSH5d4tgjP71w4W0aVwoD8gwTqpzegH/qLwTlijjCWbuIeLiqSuPoe2+2InGY0eM9aWMsGwQAeKvoKJg2Jk9+2yHLbV6uZ1XHTxcuO1AkMvf2KnGjtS9SWBwHarD5EnbcnqZleMfkVJ2LdWdtj/xAPesw6P7JMKUSzFR/NHbTd0xJu2OAo9goPVG1L4QLqA/qGZ2RR8dDuohVcv9BhJh+nspOlvmPNmNUL+NDKFtyJOCbCT62adMRPuWcSBeGpgPLLY6ssijG775U9zLkg4QoK2DctU9Raynv9MuMSzsKwxC9OJ1BRSOzmw2UxG9/OhSmhJihLqLUo8vbnRB56i3L6nnRco08nmrtuIQvpQdUYgB/8eCv7hhoEhjgbOM7Eg4NRXlMLyIDS16SWGAmew==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(136003)(366004)(346002)(376002)(186003)(66556008)(8936002)(4326008)(76116006)(2906002)(66946007)(5660300002)(66446008)(6512007)(316002)(66476007)(110136005)(71200400001)(64756008)(54906003)(2616005)(6636002)(31696002)(83380400001)(86362001)(36756003)(6506007)(966005)(53546011)(8676002)(31686004)(478600001)(26005)(6486002)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: swCYHIixrAcYEIwrASU+FQn0JIwX4FthplF/pMt4hMEWjxmskEvdlptI0toYln8Wr1SUrrPCQIBvDGsCAV9/nqIZ72JskcQ4SbHL8cNyYLg/utP8/N9cUSLjhVw/UcbGb/zgBhgIw3fOe/bH4vFzEtaHiujRmjcSsxLUEkOKRA5Dz5w7Um/5/MkIIE0V+FeCjSQN60ylPYgzVMDDYbApWKsduc0T4Ss97yhWdvSvkIe9a8cChzFRuoqB/ehRnQUQMgHxMrAUh6M0t3Zm7bkP22QSQ9CzmsIeQaTa4+LYh2a9aMrd9GuICggOEEaBji4T+JXLFK5w3LgWwwzsD0Cmmq4YIAJAPGrUqrFAU1pbwv5dWbkOzsaHc7qxtty/sSkFqMawXCwJDJkWqT/QA/+k8K9JKUhAy/DCftD6nGfq9fZ9VetmovJMBUdx5OF+VNGs9EO05SeydArR0E3HG3d+cB99ixlAC5y+muWB8GjJwQ8fepvgZaE5QtMuQnXuR4DKXOAZRydyftuE4wVnoT4u5vjy1oPK5KVnHLjOCF5Ye/0iyF7sJ5QSdNvfhFeMuT2uL7QewdeY3h37Ojl9gtRXRzK7jOCUzS/xp+sSI8nR/hH+WQpd+k8/Ob89Boa01VSKGfnBqB+3C4RyBx7S+FYW2Q==
Content-ID: <0AC154D5EE6490448ADDFE68F796CB75@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e392331c-acb9-4d6a-6411-08d87a1a01cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2020 01:45:38.9912 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aRqV7xBk0Tld/JFjM6TB3hxCEP+vuzfslNiPxv2gvD9on3Yccg75bDM6sEC8GSqd4xzl4wa0ygImp6eX9ITTzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4258
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_214549_842578_99AF3A1F 
X-CRM114-Status: GOOD (  16.08  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: arcml <linux-snps-arc@lists.infradead.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Geert,

On 10/26/20 2:48 AM, Geert Uytterhoeven wrote:
> On Mon, Oct 26, 2020 at 10:46 AM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
>> Below is the list of build error/warning regressions/improvements in
>> v5.10-rc1[1] compared to v5.9[2].
>>
>> Summarized:
>>   - build errors: +3/-7
>>   - build warnings: +26/-28
>>
>>
>>   + {standard input}: Error: inappropriate arguments for opcode 'adc':  => 170
> arc-gcc10/axs101_defconfig

Thx for bringing this to our notice. Alexey / Claudiu - are we testing gcc-10 for
ARC700 - It seemsv5.10-rcX kerne is unearthing some sort of compiler issue

http://kisskb.ellerman.id.au/kisskb/branch/linus/head/3650b228f83adda7e5ee532e2b90429c03f7b9ec/
http://kisskb.ellerman.id.au/kisskb/target/189425/
http://kisskb.ellerman.id.au/kisskb/buildresult/14384487/log/

-------->

# < make -s -j 24 ARCH=arc O=/kisskb/build/linus_axs101_defconfig_arc-gcc10 CROSS_COMPILE=/opt/cross/kisskb/korg/gcc-10.1.0-nolibc/arc-linux/bin/arc-linux-  help
# make -s -j 24 ARCH=arc O=/kisskb/build/linus_axs101_defconfig_arc-gcc10 CROSS_COMPILE=/opt/cross/kisskb/korg/gcc-10.1.0-nolibc/arc-linux/bin/arc-linux-  olddefconfig
# make -s -j 24 ARCH=arc O=/kisskb/build/linus_axs101_defconfig_arc-gcc10 CROSS_COMPILE=/opt/cross/kisskb/korg/gcc-10.1.0-nolibc/arc-linux/bin/arc-linux-  
{standard input}: Assembler messages:
{standard input}:170: Error: inappropriate arguments for opcode 'adc'
make[2]: *** [/kisskb/src/scripts/Makefile.build:283: fs/remap_range.o] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/kisskb/src/Makefile:1799: fs] Error 2
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:185: __sub-make] Error 2
Command 'make -s -j 24 ARCH=arc O=/kisskb/build/linus_axs101_defconfig_arc-gcc10 CROSS_COMPILE=/opt/cross/kisskb/korg/gcc-10.1.0-nolibc/arc-linux/bin/arc-linux-  ' returned non-zero exit status 2
# rm -rf /kisskb/build/linus_axs101_defconfig_arc-gcc10
# Build took: 0:01:21.179119

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

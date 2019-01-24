From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 24 Jan 2019 08:37:12 -0800
Subject: [PATCH v2] ARC: [scripted] fix node name and address spelling
In-Reply-To: <CAL_JsqLfe0YN9ytYfE=quuqSpNgavGhr5rDc42SirrUfYXO66g@mail.gmail.com>
References: <20190124121703.2337-1-abrodkin@synopsys.com>
 <CAL_JsqLfe0YN9ytYfE=quuqSpNgavGhr5rDc42SirrUfYXO66g@mail.gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <082c0b8a-13fc-d30a-67fe-13011cc52f5f@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Alexey, Rob,

On 1/24/19 8:28 AM, Rob Herring wrote:
> On Thu, Jan 24, 2019 at 6:17 AM Alexey Brodkin
> <alexey.brodkin@synopsys.com> wrote:
>>
>> From: Alexey Brodkin <alexey.brodkin at synopsys.com>
>>
>> 1. Remove "0x" prefix from unit-address of node names
>> ----------------------->8------------------------
>> sed -i 's/@0x/@/g' arch/arc/boot/dts/*.dts*
>> ----------------------->8------------------------
>>
>> 2. Make all hex addresses lowercase:
>> ----------------------->8------------------------
>> sed -i 's/@\([0-9A-Za-z]*\)/@\L\1/g' arch/arc/boot/dts/*.dts*
>> sed -i 's/0x\([0-9A-Za-z]*\)/0x\L\1/g' arch/arc/boot/dts/*.dts*
>> ----------------------->8------------------------
>>
>> Inspired by [1] and the like.
>>
>> [1] http://kisskb.ellerman.id.au/kisskb/buildresult/13612017/
>>
>> Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
>> Cc: Rob Herring <robh+dt at kernel.org>
>> ---
>>
>> Changes v1 -> v2:
>>
>>  * Convert all hex addresses to lower-case [Rob]
>>
>>  arch/arc/boot/dts/abilis_tb100.dtsi    | 58 ++++++++++++++++----------------
>>  arch/arc/boot/dts/abilis_tb100_dvk.dts | 14 ++++----
>>  arch/arc/boot/dts/abilis_tb101.dtsi    | 58 ++++++++++++++++----------------
>>  arch/arc/boot/dts/abilis_tb101_dvk.dts | 14 ++++----
>>  arch/arc/boot/dts/abilis_tb10x.dtsi    | 60 +++++++++++++++++-----------------
>>  arch/arc/boot/dts/axc001.dtsi          |  6 ++--
>>  arch/arc/boot/dts/axc003.dtsi          | 16 ++++-----
>>  arch/arc/boot/dts/axc003_idu.dtsi      | 16 ++++-----
>>  arch/arc/boot/dts/axs10x_mb.dtsi       | 22 ++++++-------
>>  arch/arc/boot/dts/hsdk.dts             |  4 +--
>>  arch/arc/boot/dts/vdk_axc003.dtsi      |  4 +--
>>  arch/arc/boot/dts/vdk_axc003_idu.dtsi  |  4 +--
>>  arch/arc/boot/dts/vdk_axs10x_mb.dtsi   | 18 +++++-----
>>  13 files changed, 147 insertions(+), 147 deletions(-)
> 
> Reviewed-by: Rob Herring <robh at kernel.org>


Thx for the quick look at this. I've added this to ARC for-curr !

Thx,
-Vineet
